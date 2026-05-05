# FYP Report — *Adaptive Web Interaction*

LaTeX source for the Final Year Project report:

> **Adaptive Web Interaction: Leveraging Reinforcement Learning for Comprehensive Action Support**
> Muhammad Saad Ashraf, Muhammad Salman Siddiq, Awais Nazir
> Supervisor: Dr. Faisal Shafait — National University of Sciences and Technology (NUST), 2026

The report accompanies the code repository at
[github.com/saad1551/final-year-project](https://github.com/saad1551/final-year-project).

## Repository contents

```
fyp-report/
├── report.tex          ← single-file LaTeX source
├── Makefile            ← `make` to build, `make view` to open, `make clean` to wipe artefacts
├── figures/
│   ├── figure1_dataset_decay.{pdf,png}   — feasibility-audit breakdown (§5.1)
│   ├── figure2.{pdf,png}                 — training dynamics (§5.2)
│   └── figure3.{pdf,png}                 — held-out evaluation comparison (§5.3)
├── bib/                — empty, reserved for future .bib migration
└── README.md           ← this file
```

The bibliography is currently inline (`thebibliography` environment) in `report.tex`. If you migrate to BibTeX or BibLaTeX, drop the .bib file under `bib/` and update the `\bibliography` line.

## Building the PDF

### Prerequisites

A LaTeX distribution that includes `pdflatex` and the standard packages used here (`geometry`, `setspace`, `graphicx`, `booktabs`, `amsmath`, `xcolor`, `hyperref`, `microtype`, `listings`, `caption`, `lmodern`). Any of:

- **MacOS / Linux** — `MacTeX` (full) or `BasicTeX` (minimal; you may need to `tlmgr install` a few packages)
- **Linux** — `texlive-full` or `texlive-latex-extra`
- **Windows** — `MiKTeX` or `TeX Live`

If you only have BasicTeX and a missing-package error appears, run:
```bash
sudo tlmgr install <package-name>
```

### Build

From the repo root:
```bash
make            # 3 LaTeX passes for ToC + cross-references → report.pdf
make view       # build + open the resulting PDF (macOS)
make clean      # remove build artefacts (.aux, .log, etc.) and the PDF
```

That's it. No external dependencies, no scripts to download anything, no environment setup.

## Editing

The source is a single `report.tex` file (~900 lines). Section structure:

- Front matter: title page, certificate / declaration placeholder, acknowledgments, abstract, ToC / lists / abbreviations
- Chapter 1 — Introduction
- Chapter 2 — Literature Review
- Chapter 3 — Methodology
- Chapter 4 — Implementation
- Chapter 5 — Results & Discussion (Figure 1, Figure 2, Figure 3 + Tables)
- Chapter 6 — Conclusion & Future Work
- References (`thebibliography`)
- Appendices A–E

The `\status{...}` macro at the top is currently a no-op (suppressed for the final compile). If you want to re-enable section status markers ("[DRAFT]", "[FILL]", etc.), redefine `\status` to render `\textcolor{red!70!black}{\small\textbf{[#1]}}` and bring back the `\done` / `\draftt` / `\fillt` / `\outlinet` calls per section.

## License

The report content (text, figures) is © 2026 the authors. The LaTeX scaffolding (Makefile, `.gitignore`, README) is MIT-licensed; reuse encouraged.
