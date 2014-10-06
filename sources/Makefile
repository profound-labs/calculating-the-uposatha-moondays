LATEX=lualatex
LATEX_OPTS=-interaction=nonstopmode -halt-on-error
MAIN=calculating-the-uposatha-moondays

none:
	$(LATEX) $(LATEX_OPTS) $(MAIN) &&\
	bibtex $(MAIN) &&\
	$(LATEX) $(LATEX_OPTS) $(MAIN) &&\
	$(LATEX) $(LATEX_OPTS) $(MAIN)

clean:
	+rm -fv *.{dvi,ps,aux,log,bbl,blg}
