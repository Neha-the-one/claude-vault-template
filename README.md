# claude-vault-template

A Claude Code-native knowledge vault template for product and engineering pods.

**No build toolchain. All content is Markdown. GitHub Pages auto-deploys on push to `main`.**

## What you get

- A polished Jekyll site with a guided landing page, nav search with dropdown, and Start Here onboarding overlay
- A `CLAUDE.md` librarian contract — Claude Code reads this and knows exactly how to create pages, maintain the vault index, and push content
- A `VAULT.md` machine-readable index that Claude keeps in sync automatically
- An `AGENT.md` orientation file so any new Claude session can get up to speed in seconds
- A `scripts/vault-check.sh` pre-commit hook that prevents pushing pages that aren't indexed

## Quick start

### 1. Fork or use this template

Click **Use this template** → **Create a new repository**. Give it a name, set it to public or private.

### 2. Enable GitHub Pages

Repo → **Settings** → **Pages** → Source: **Deploy from a branch** → Branch: `main` / `/ (root)` → Save.

Your site will be live at `https://your-username.github.io/your-repo-name` within a minute or two.

### 3. Open the repo in Claude Code

```bash
git clone https://github.com/your-username/your-repo-name
cd your-repo-name
claude
```

### 4. Customise the nav and vault index

In `_layouts/default.html`, replace the placeholder nav link(s) and the `VAULT` array entries with your actual pages. Claude will keep both in sync as you add content.

In `_config.yml`, set your site title.

### 5. Start compiling content

Paste any raw content (notes, doc, transcript, research) into a Claude session and say:

```
compile
```

Claude will:
- Decide which section the content belongs to
- Create a `.md` page with correct front matter
- Update `index.md`, `VAULT.md`, and the section hub
- Push to `main`

## Customising the design

All CSS variables are in `assets/css/style.css` under `:root`. Change `--navy`, `--accent`, and `--font` to match your brand. Nothing else needs to touch.

## How the vault search works

The nav search dropdown is powered by the `VAULT` array in `_layouts/default.html`. Every time Claude adds a new page, it adds a corresponding entry to that array. Users can search from any page in the vault — results appear inline, no page reload needed.

## File structure

```
/
├── CLAUDE.md              ← librarian rules; Claude reads this every session
├── AGENT.md               ← sprint status, site map, where-to-look-for-X
├── VAULT.md               ← machine-readable index of every page
├── index.md               ← landing page (customise hero, sections, KB TOC)
├── _config.yml            ← site title only
├── _layouts/
│   ├── default.html       ← landing page shell + nav search JS
│   └── page.html          ← inner page shell
├── assets/css/style.css   ← full design system (CSS variables at top)
├── scripts/
│   └── vault-check.sh     ← pre-commit hook: verifies all .md files are in VAULT.md
└── section-name/
    └── index.md           ← example section hub (rename or delete)
```

## Licence

MIT
