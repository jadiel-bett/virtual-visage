import AxeBuilder from "@axe-core/playwright";
import { expect, test } from "@playwright/test";

test("primary navigation reaches every core page", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByRole("heading", { level: 1 })).toContainText(
    "Software built with a systems perspective",
  );

  for (const route of ["/work", "/about", "/notes", "/resume"]) {
    await page.goto(route);
    await expect(page.getByRole("heading", { level: 1 })).toBeVisible();
  }
});

test("project filters retain and reveal semantic project cards", async ({ page }) => {
  await page.goto("/work");
  await expect(page.locator("[data-project-card]")).toHaveCount(6);

  await page.getByRole("button", { name: "AI + data" }).click();
  await expect(page.locator("[data-project-card]:visible")).toHaveCount(1);
  await expect(page.getByRole("article").filter({ hasText: "MaskGuard" })).toBeVisible();

  await page.getByRole("button", { name: "All work" }).click();
  await expect(page.locator("[data-project-card]:visible")).toHaveCount(6);
});

test("mobile menu opens, closes, and exposes contact", async ({ page }) => {
  await page.setViewportSize({ width: 360, height: 800 });
  await page.goto("/");

  const toggle = page.getByRole("button", { name: "Toggle navigation" });
  await toggle.click();
  await expect(toggle).toHaveAttribute("aria-expanded", "true");
  await expect(page.getByRole("navigation", { name: "Primary navigation" })).toBeVisible();
  await page.keyboard.press("Escape");
  await expect(toggle).toHaveAttribute("aria-expanded", "false");
});

test("contact form exposes validation and a success destination", async ({ page }) => {
  await page.goto("/#contact");
  const form = page.locator('form[name="portfolio-inquiry"]');
  await expect(form).toBeVisible();
  await form.getByRole("button", { name: "Send inquiry" }).click();
  await expect(form.locator('input[name="name"]')).toHaveJSProperty("validity.valid", false);
  await page.goto("/contact-success");
  await expect(page.getByRole("heading", { level: 1 })).toContainText(
    "Thank you for reaching out",
  );
});

test("résumé and case-study evidence are reachable", async ({ page, request }) => {
  const resume = await request.get("/jadiel-bett-resume.pdf");
  expect(resume.ok()).toBeTruthy();
  expect(resume.headers()["content-type"]).toContain("application/pdf");

  await page.goto("/work/maskguard");
  await expect(page.getByRole("link", { name: /View source/ })).toHaveAttribute(
    "href",
    "https://github.com/jadiel-bett/mask_detector",
  );
});

test("homepage has no serious accessibility violations", async ({ page }) => {
  await page.goto("/");
  const results = await new AxeBuilder({ page }).analyze();
  const serious = results.violations.filter((violation) =>
    ["serious", "critical"].includes(violation.impact ?? ""),
  );
  expect(serious).toEqual([]);
});


test("unknown routes use the helpful custom 404", async ({ page }) => {
  const response = await page.goto("/this-route-does-not-exist");
  expect(response?.status()).toBe(404);
  await expect(page.getByRole("heading", { level: 1 })).toHaveText(
    "This route does not connect.",
  );
  await expect(page.getByRole("link", { name: "Explore work" })).toHaveAttribute(
    "href",
    "/work",
  );
});

test("public profile and product links are explicit", async ({ page }) => {
  await page.goto("/#contact");
  await expect(page.getByRole("link", { name: "GitHub" })).toHaveAttribute(
    "href",
    "https://github.com/jadiel-bett",
  );
  await expect(page.getByRole("link", { name: "LinkedIn" })).toHaveAttribute(
    "href",
    "https://www.linkedin.com/in/jadiel-bett-5a6101169/",
  );

  await page.goto("/work/count-game");
  await expect(page.getByRole("link", { name: /View on Google Play/ })).toHaveAttribute(
    "href",
    "https://play.google.com/store/apps/details?id=com.jadielbett.count_game",
  );
});
