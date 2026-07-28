import { existsSync, readFileSync, readdirSync, statSync } from "node:fs";
import { extname, join, relative, resolve } from "node:path";
import { gzipSync } from "node:zlib";

const dist = resolve("dist");
const jsBudget = 75 * 1024;
const initialBudget = 1024 * 1024;
const responsiveImageBudget = 200 * 1024;

function walk(directory) {
  return readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const path = join(directory, entry.name);
    return entry.isDirectory() ? walk(path) : [path];
  });
}

function localPath(url) {
  if (!url?.startsWith("/") || url.startsWith("//")) return undefined;
  return join(dist, decodeURIComponent(url.split(/[?#]/)[0]).replace(/^[/\\]+/, ""));
}

function transferSize(path) {
  const extension = extname(path);
  const contents = readFileSync(path);
  return [".html", ".css", ".js", ".svg", ".xml", ".txt"].includes(extension)
    ? gzipSync(contents).byteLength
    : contents.byteLength;
}

if (!existsSync(dist)) {
  throw new Error("Missing dist directory. Run the Astro build first.");
}

const files = walk(dist);
const jsBytes = files
  .filter((path) => extname(path) === ".js")
  .reduce((total, path) => total + gzipSync(readFileSync(path)).byteLength, 0);

if (jsBytes > jsBudget) {
  throw new Error(`Client JavaScript is ${jsBytes} bytes gzipped; budget is ${jsBudget}.`);
}

const oversizedImages = files
  .filter((path) => [".avif", ".webp"].includes(extname(path)))
  .filter((path) => statSync(path).size > responsiveImageBudget);

if (oversizedImages.length) {
  throw new Error(
    `Responsive image budget exceeded:\n${oversizedImages
      .map((path) => `- ${relative(dist, path)} (${statSync(path).size} bytes)`)
      .join("\n")}`,
  );
}

const homepage = join(dist, "index.html");
const html = readFileSync(homepage, "utf8");
const initialFiles = new Set([homepage]);

for (const match of html.matchAll(/<(?:link|script)\b[^>]+(?:href|src)="([^"]+)"/g)) {
  const path = localPath(match[1]);
  if (path && existsSync(path)) initialFiles.add(path);
}

for (const match of html.matchAll(/<img\b([^>]+)>/g)) {
  if (/\bloading="lazy"/.test(match[1])) continue;
  const src = match[1].match(/\bsrc="([^"]+)"/)?.[1];
  const path = localPath(src);
  if (path && existsSync(path)) initialFiles.add(path);
}

for (const stylesheet of [...initialFiles].filter((path) => extname(path) === ".css")) {
  const css = readFileSync(stylesheet, "utf8");
  for (const match of css.matchAll(/url\((?:["']?)([^"')]+)(?:["']?)\)/g)) {
    const path = localPath(match[1]);
    if (path && existsSync(path)) initialFiles.add(path);
  }
}

const inlineScriptBytes = [...html.matchAll(/<script(?:\s[^>]*)?>([\s\S]*?)<\/script>/g)]
  .filter((match) => !/\bsrc=/.test(match[0]))
  .reduce((total, match) => total + gzipSync(match[1]).byteLength, 0);

const initialBytes =
  [...initialFiles].reduce((total, path) => total + transferSize(path), 0) +
  inlineScriptBytes;

if (initialBytes > initialBudget) {
  throw new Error(
    `Estimated homepage transfer is ${initialBytes} bytes; budget is ${initialBudget}.`,
  );
}

console.log(
  `Budgets passed: ${jsBytes} B gzipped client JS, ${initialBytes} B estimated initial transfer, responsive images ≤ ${responsiveImageBudget} B.`,
);
