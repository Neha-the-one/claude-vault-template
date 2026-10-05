# CLAUDE.md

This file provides guidance to Claude Code when working in this repository.

## What this repo is

A Claude Code-native knowledge vault for a product or engineering pod. No build toolchain. All content is Markdown; the site is rendered by GitHub Pages automatically on push to `main`.

## Jekyll structure

- `_config.yml` — site title and description only. No theme declared (custom layouts handle everything).
- `_layouts/default.html` — landing page shell (hero, nav, footer). Used by `index.md`.
- `_layouts/page.html` — inner page shell (same nav/footer + wraps content in `.prose`). Used by all other `.md` files via `layout: page` front matter.
- `assets/css/style.css` — full design system. CSS variables defined in `:root`. Swap `--navy`, `--accent`, and `--font` to match your brand.
- `index.md` — landing page. Raw HTML with Jekyll Liquid (`{{ '/path' | relative_url }}`).

## Content structure

Sections live in their own directories. Each section has at least one hub or index page.
Customize these to match your project — common examples:

- `problem/` — problem statement, decisions, current-state analysis
- `discovery/` — hypotheses, customer signals, research artifacts
- `architecture/` — technical designs, ADRs, system docs
- `metrics/` — sprint scoreboard, weekly snapshots
- `team/` — roster, working agreement, meeting notes
- `customers/` — customer tracking; use `customers/_template.md` for new entries
- `references/` — external links index

## Agent Orientation Files

Two root-level files exist for agent use. Not linked from the human nav but linked from here.

- `AGENT.md` — compressed orientation: sprint status, site map, where-to-look-for-X, stubs, key decisions. Read this first in any new session.
- `VAULT.md` — flat machine-readable index of every page: path, status, maturity, last_updated, one-line summary.

## Adding a new inner page

1. Create `section/filename.md` with front matter:
   ```yaml
   ---
   layout: page
   status: draft          # stub | draft | in-progress | current | validated | legacy
   last_updated: YYYY-MM-DD
   topic: architecture    # architecture | discovery | decisions | metrics | team | product | customers | references
   maturity: low          # stub | low | medium | high
   summary: "One sentence, max 100 chars."
   ---
   ```
2. Link it from `index.md` KB TOC and from the relevant section hub page.
3. Add a row to `VAULT.md`.
4. If the file is >200 lines, add a TL;DR block immediately after the title H1:
   `> **TL;DR** [status/version. max 100 words. note any superseding files.]`
5. Push to `main`.

## Compile

When I say **"compile"**, treat the content just shared as raw material and:
1. Decide which section it belongs to (or propose a new one)
2. Create or update a `.md` page with proper front matter, structured as bullet points over paragraphs
3. Update `index.md` KB TOC if it's a new page
4. Update the relevant section hub page if applicable
5. Push to `main`

## Librarian Rules

- You are the librarian. The section folders are your domain — you write and maintain content in them.
- `index.md` is the human navigation entry point. `VAULT.md` is the complete page inventory (includes unlisted orphans). They are not the same thing.
- Every section should have a clear hub page. Keep those pages current.
- When adding a new page, always update `index.md` KB TOC, `VAULT.md` table row, and any relevant section hub page.
- **Before pushing**: run `bash scripts/vault-check.sh` from repo root. Fix any gaps before pushing.
- **When a sprint ends**: update `AGENT.md` sprint status block.
- **Meeting transcripts**: add `accuracy: ai-generated` or `accuracy: verified` to front matter.

## File & Naming Conventions

- Filenames: **kebab-case**. No spaces, no capitals.
- Every inner page needs `layout: page` front matter — no exceptions.
- **Stub articles**: add `> Status: stub — pending source material` below the title. Never leave "TBD" placeholder text.
- Use standard Markdown links `[text](path)` — no `[[wikilinks]]`.
