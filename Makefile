## Encoding: ISO8859-1 ##

MASTER=presentation
.PHONY: clean
.PHONY: quick

pdf: presentation.tex content.tex *.bib
	lualatex $(MASTER).tex || true
	bibtex $(MASTER) || true
	lualatex $(MASTER).tex || true
	lualatex $(MASTER).tex || true

quick: presentation.tex content.tex
	lualatex $(MASTER).tex || true

content.tex: content.md
	pandoc content.md -t beamer --slide-level 2 -o content.tex

clean:
	rm -f *.aux
	rm -f *.log
	rm -f *.nav
	rm -f *.out
	rm -f *.snm
	rm -f *.toc
	rm -f *.bbl
	rm -f *.blg
	rm -f *.zip
	rm -f *~

