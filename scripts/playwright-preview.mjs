import { spawn } from "node:child_process";
import { fileURLToPath } from "node:url";

const host = "127.0.0.1";
const astroCli = fileURLToPath(new URL("../node_modules/astro/bin/astro.mjs", import.meta.url));
const env = { ...process.env };

// Astro 7 backgrounds preview servers when it detects an AI-agent shell. The
// Playwright webServer contract needs a foreground process it can terminate.
for (const key of [
  "CODEX_THREAD_ID",
  "CLAUDECODE",
  "CURSOR_TRACE_ID",
  "ANTIGRAVITY_AGENT",
  "ANTIGRAVITY_PROJECT_ID",
  "GEMINI_CLI",
  "REPL_ID",
  "AIDER_API_KEY",
  "CODEIUM_EDITOR_APP_ROOT",
  "AMP_CURRENT_THREAD_ID",
  "AUGMENT_AGENT",
  "QWEN_CODE",
]) {
  delete env[key];
}

const preview = spawn(process.execPath, [astroCli, "preview", "--host", host], {
  env,
  stdio: "inherit",
});

let shuttingDown = false;
function forwardSignal(signal) {
  shuttingDown = true;
  preview.kill(signal);
}

process.on("SIGINT", () => forwardSignal("SIGINT"));
process.on("SIGTERM", () => forwardSignal("SIGTERM"));
preview.once("exit", (code, signal) => {
  process.exit(shuttingDown ? 0 : (code ?? (signal ? 1 : 0)));
});