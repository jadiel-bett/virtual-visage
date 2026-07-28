import { existsSync, readdirSync, readFileSync, statSync } from "node:fs";
import { extname, join, resolve } from "node:path";

const dist = resolve("dist");
const htmlFiles = [];

function walk(directory) {
  for (const entry of readdirSync(directory)) {
    const path = join(directory, entry);
    if (statSync(path).isDirectory()) walk(path);
    else if (path.endsWith(".html")) htmlFiles.push(path);
  }
}

function targetExists(pathname) {
  const clean = decodeURIComponent(pathname.split(/[?#]/)[0]);
  const relative = clean.replace(/^\/+/, "");
  const direct = join(dist, relative);

  if (existsSync(direct) && statSync(direct).isFile()) return true;
  if (existsSync(join(direct, "index.html"))) return true;
  if (!extname(direct) && existsSync(`${direct}.html`)) return true;
  return false;
}

if (!existsSync(dist)) {
  throw new Error("dist/ does not exist. Run the production build first.");
}

walk(dist);
const broken = [];
const invalid = [];

for (const file of htmlFiles) {
  const html = readFileSync(file, "utf8");
  const h1Count = (html.match(/<h1(?:\s|>)/g) ?? []).length;

  if (h1Count !== 1) {
    invalid.push(`${file}: expected exactly one h1, found ${h1Count}`);
  }
  if (html.includes("jadielbett.dev")) {
    invalid.push(`${file}: contains obsolete jadielbett.dev domain`);
  }
  if (/placeholder resume/i.test(html)) {
    invalid.push(`${file}: contains placeholder résumé content`);
  }

  const attributes = html.matchAll(/\b(?:href|src|action)="([^"]+)"/g);
  for (const [, value] of attributes) {
    if (
      !value.startsWith("/") ||
      value.startsWith("//") ||
      value.startsWith("/#")
    ) {
      continue;
    }
    if (!targetExists(value)) {
      broken.push(`${file}: ${value}`);
    }
  }
}

if (broken.length || invalid.length) {
  const messages = [
    ...invalid.map((message) => `Invalid document: ${message}`),
    ...broken.map((message) => `Broken internal target: ${message}`),
  ];
  throw new Error(messages.join("\n"));
}

console.log(
  `Validated ${htmlFiles.length} HTML pages: headings, domains, and internal targets are clean.`,
);
