REPORT = report
LATEX  = pdflatex -interaction=nonstopmode -halt-on-error

.PHONY: all clean view

all: $(REPORT).pdf

# Two passes for ToC + lists; third for cross-references
$(REPORT).pdf: $(REPORT).tex figures/figure1_dataset_decay.pdf
	$(LATEX) $(REPORT).tex
	$(LATEX) $(REPORT).tex
	$(LATEX) $(REPORT).tex

view: all
	open $(REPORT).pdf

clean:
	rm -f $(REPORT).aux $(REPORT).log $(REPORT).out $(REPORT).toc \
	      $(REPORT).lof $(REPORT).lot $(REPORT).fdb_latexmk $(REPORT).fls \
	      $(REPORT).synctex.gz $(REPORT).pdf
