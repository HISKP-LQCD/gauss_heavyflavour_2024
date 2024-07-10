ROOT:=$(shell pwd)

SOURCEFILES = $(shell find . -name '*.tex')
FIGURES = $(shell find plots/ -name '*.pdf')
BIBS = $(shell find . -name '*.bib')


proposal.pdf: ${SOURCEFILES} ${FIGURES} ${BIBS}
	latexmk -f -bibtex -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make proposal.tex


.PHONY: tidy
tidy:
	$(RM) *.aux
	$(RM) proposalNotes.bib
	$(RM) $(addprefix proposal.,log aux synctex.gz blg toc fls fdb_latexmk)
	$(RM) *~

.PHONY: clean
clean: tidy
	latexmk -CA
	$(RM) proposal.bbl
	$(RM) proposal.pdf

