filename = myfile

bibname = mybib

autogens = $(filename).aux $(filename).bbl $(filename).bcf \
		$(filename).blg $(filename).log $(filename).out \
		$(filename).pyg $(filename).run.xml auto/

$(filename).pdf : $(filename).tex $(filename).bbl
	pdflatex -shell-escape $(filename)

$(filename).tex : $(filename).md
	pandoc --biblatex -s -R -S -f markdown -t latex -o $(filename).tex \
		$(filename).md

$(filename).bbl : $(filename).bcf
	biber $(filename)

$(filename).bcf : $(filename).tex $(bibname).bib
	pdflatex -shell-escape $(filename)

.PHONY : clean purge count
clean :
	-rm -rf $(autogens)

purge :
	-rm -rf $(autogens) $(filename).tex $(filename).pdf

count :
	texcount $(filename).tex
