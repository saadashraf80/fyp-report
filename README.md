# FYP Report — *Adaptive Web Interaction*

LaTeX source for the Final Year Project report:

> **Adaptive Web Interaction: Leveraging Reinforcement Learning for Comprehensive Action Support**
> Muhammad Saad Ashraf, Muhammad Salman Siddiq, Awais Nazir
> Supervisor: Dr. Faisal Shafait — National University of Sciences and Technology (NUST), 2026

The report accompanies the code repository at
[github.com/saad1551/final-year-project](https://github.com/saad1551/final-year-project).

---

## How to compile

You have **two options** depending on what you want:

### Option A — Just read the PDF (no compilation needed)

The compiled report is committed in the repository. Open `report.pdf` directly:

```bash
git clone https://github.com/saadashraf80/fyp-report
cd fyp-report
open report.pdf          # macOS
xdg-open report.pdf      # Linux
start report.pdf         # Windows
```

### Option B — Rebuild the PDF from source

#### Step 1 — Install LaTeX

You need a LaTeX distribution that includes `pdflatex` plus the standard package set used by the report (`geometry`, `setspace`, `graphicx`, `booktabs`, `array`, `amsmath`, `amssymb`, `xcolor`, `hyperref`, `microtype`, `listings`, `caption`, `lmodern`, `inputenc`, `fontenc`).

**macOS:**
```bash
brew install --cask mactex          # full distribution (~5 GB) — recommended
# or, smaller:
brew install --cask basictex        # minimal (~100 MB) — may need tlmgr installs later
```

**Linux (Debian / Ubuntu):**
```bash
sudo apt-get update
sudo apt-get install -y texlive-latex-extra texlive-fonts-extra
# or, full distribution:
sudo apt-get install -y texlive-full
```

**Linux (Fedora / RHEL):**
```bash
sudo dnf install texlive-scheme-full
```

**Windows:**
- Download and install [MiKTeX](https://miktex.org/download) (auto-installs missing packages on first compile), or
- Download and install [TeX Live](https://tug.org/texlive/) (full distribution).

#### Step 2 — Verify the install

```bash
pdflatex --version
# Expect: pdfTeX 3.x ... (TeX Live YYYY) or similar
```

If `pdflatex` is not on your `PATH`, add the TeX `bin` directory (e.g. `/Library/TeX/texbin` on macOS, `/usr/local/texlive/<year>/bin/x86_64-linux` on Linux) to your shell profile.

#### Step 3 — Build

From the repository root:

```bash
make            # 3 LaTeX passes for ToC + cross-references → report.pdf
make view       # build, then open the resulting PDF (macOS)
make clean      # remove build artefacts (.aux, .log, etc.) and report.pdf
```

If you don't have `make` (uncommon on macOS / Linux; possible on Windows), run the same commands manually:

```bash
pdflatex -interaction=nonstopmode -halt-on-error report.tex
pdflatex -interaction=nonstopmode -halt-on-error report.tex
pdflatex -interaction=nonstopmode -halt-on-error report.tex
```

Yes, three passes — the first generates `.aux` / `.toc`, the second resolves cross-references, the third stabilises page numbers in the ToC.

#### If you hit a "package not found" error (BasicTeX users)

BasicTeX ships a minimal package set; full distributions don't have this problem. If `pdflatex` reports `! LaTeX Error: File 'foo.sty' not found.`, install the missing package via TeX's package manager:

```bash
sudo tlmgr install <package-name>          # macOS / Linux with TeX Live
```

Common packages you may need: `microtype`, `listings`, `caption`, `hyperref`, `lmodern`. Install all at once:

```bash
sudo tlmgr install microtype listings caption hyperref lmodern booktabs setspace geometry
```

Then re-run `make`.

#### Build time

A clean build takes ~10–15 seconds on a modern laptop. Subsequent builds (after edits) are similar — there's no caching layer worth talking about.

---

## Repository contents

```
fyp-report/
├── report.tex          ← single-file LaTeX source (~900 lines)
├── report.pdf          ← pre-built output (48 pages, ~530 KB) — open this if you don't want to compile
├── Makefile            ← build automation
├── figures/
│   ├── figure1_dataset_decay.pdf   — feasibility-audit breakdown (§5.1)
│   ├── figure2.{pdf,png}           — training dynamics (§5.2)
│   └── figure3.{pdf,png}           — held-out evaluation comparison (§5.3)
├── bib/                — empty, reserved for future .bib migration
├── .gitignore
└── README.md           ← this file
```

The bibliography is currently inline (`thebibliography` environment) inside `report.tex`, so there is no separate `.bib` file or `bibtex` / `biber` pass — `pdflatex` is the only tool needed.

## Editing

The source is a single `report.tex` file. Section structure:

- Front matter: title page, certificate / declaration placeholder, acknowledgments, abstract, ToC / lists / abbreviations
- Chapter 1 — Introduction
- Chapter 2 — Literature Review
- Chapter 3 — Methodology
- Chapter 4 — Implementation
- Chapter 5 — Results & Discussion (Figure 1, Figure 2, Figure 3 + Tables)
- Chapter 6 — Conclusion & Future Work
- References (`thebibliography`)
- Appendices A–E

The `\status{...}` macro at the top is currently a no-op (suppressed for the final compile). To re-enable section status markers ("[DRAFT]", "[FILL]", etc.) during drafting, redefine `\status` to render `\textcolor{red!70!black}{\small\textbf{[#1]}}` and bring back the `\done` / `\draftt` / `\fillt` / `\outlinet` calls per section.

## License

The report content (text, figures) is © 2026 the authors. The LaTeX scaffolding (Makefile, `.gitignore`, README) is MIT-licensed; reuse encouraged.
