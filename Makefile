## Encoding: ISO8859-1 ##

MASTER=presentation
.PHONY: clean

pdf: presentation.tex content.tex *.bib
	lualatex $(MASTER).tex
	bibtex $(MASTER)
	lualatex $(MASTER).tex
	lualatex $(MASTER).tex

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

