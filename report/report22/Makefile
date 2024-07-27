.PHONY: report.pdf all clean

all: report.pdf

report.pdf: report.tex Makefile bibliography.bib
	latexmk -bibtex -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make report.tex

clean:
	latexmk -CA
