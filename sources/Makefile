LATEX=lualatex
LATEX_OPTS=-shell-escape -interaction=nonstopmode -halt-on-error
MAIN=calculating-the-uposatha-moondays

all:
	$(LATEX) $(LATEX_OPTS) $(MAIN) &&\
	biber $(MAIN) &&\
	$(LATEX) $(LATEX_OPTS) $(MAIN) &&\
	$(LATEX) $(LATEX_OPTS) $(MAIN)

once:
	$(LATEX) $(LATEX_OPTS) $(MAIN)

clean:
	rm -v *.dvi *.ps *.aux *.log *.bbl *.blg *.bcf *.toc
