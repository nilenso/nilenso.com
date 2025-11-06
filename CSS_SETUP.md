# CSS Build Setup

This project now uses **Tailwind CSS v3** with a proper build process.

## Overview

- **Source CSS**: `src/styles.css` - Contains Tailwind directives and custom CSS
- **Output CSS**: `static/style.css` - Generated file (gitignored)
- **Config**: `tailwind.config.js` - Tailwind configuration with custom theme
- **Size**: ~20KB minified (down from 2.9MB pre-built file!)

## Local Development

### Prerequisites

- Node.js and npm (for Tailwind CSS CLI)
- Zola static site generator

### Building CSS

```bash
# Build CSS once
make build-css

# Watch for changes and rebuild automatically
make watch-css

# Build entire site (CSS + Zola)
make build
```

### Development Server

```bash
# This will build CSS first, then start Zola server
make serve
```

## Production Build

On Netlify, the build command automatically:
1. Installs npm dependencies
2. Builds CSS with Tailwind
3. Builds site with Zola

See `netlify.toml` for the complete build configuration.

## Custom Theme

The `tailwind.config.js` includes:
- **Custom colors**: nilenso-pink (#FF3D84)
- **Custom font sizes**: Arbitrary values like `text-[2.8rem]`
- **Content paths**: Scans `templates/**/*.html` and `content/**/*.md`

## Custom CSS

Custom component styles are organized in layers:
- **@layer base**: HTML element defaults, typography
- **@layer components**: Reusable components (menu, swiper, tiles, etc.)
- **@layer utilities**: Responsive overrides and utility classes

## Migration Notes

This setup replaces:
- ❌ `static/tailwind.min.css` (2.9MB pre-built file)
- ❌ Workaround CSS rules for `lg:lg:` syntax
- ❌ Standalone Tailwind CLI binary

With:
- ✅ `src/styles.css` (source file with Tailwind directives)
- ✅ `package.json` (npm dependencies)
- ✅ Proper Tailwind v3 with JIT mode
- ✅ 99.3% smaller CSS bundle
