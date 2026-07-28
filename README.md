# Jadiel Bett — portfolio

The source for [jadielbett.com](https://jadielbett.com): a fast, static portfolio focused on product-engineering recruitment, contract work, and technical discovery.

## Stack

- Astro 5 and TypeScript
- Astro Content Collections for projects, experience, achievements, notes, and profile data
- CSS custom properties with minimal progressive-enhancement JavaScript
- Netlify hosting and forms
- Playwright, axe, and Lighthouse CI for quality gates

## Local development

Use Node 24 and pnpm 11.

```sh
pnpm install
pnpm dev
```

The local site runs at `http://localhost:4321` by default.

## Quality checks

```sh
pnpm check
pnpm build
pnpm test
```

`pnpm build` also checks generated HTML for a single H1, invalid legacy domains, placeholder résumé files, broken internal links, and missing assets.

## Content

Validated Markdown content lives under `src/content`:

- `projects` — project summaries and case-study evidence
- `experience` — professional and engineering experience
- `achievements` — education, launches, and other proof points
- `notes` — technical articles
- `profile` — positioning, availability, contact details, and services

Images used by Astro live under `src/assets`. Public files such as the résumé, favicon, robots file, and social card live under `public`.

See [CONTENT_INTAKE.md](CONTENT_INTAKE.md) for the fact, evidence, and media review required before production publishing.

## Résumé

The downloadable PDF is generated from `scripts/generate_resume.py`:

```sh
python scripts/generate_resume.py
```

Commit the updated `public/jadiel-bett-resume.pdf` after visually reviewing the rendered output.

## Deployment

Netlify configuration is committed in `netlify.toml`:

- Build command: `pnpm build`
- Publish directory: `dist`
- Contact form: Netlify Forms with a honeypot
- Security and immutable asset-cache headers
- Redirects from legacy résumé URLs

Deploy previews should remain out of search indexes. Review copy, form delivery, external evidence, and the social card before promoting a deploy to production.