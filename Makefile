LATEX=pdflatex -synctex=1
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf -view=none
CONTINUOUS=-pvc

MAIN=causal_decision_making

FIGURES := $(shell find img -type f)
BIB=references.bib

DIFFHASH=4448a74b6dbd569ff2d83ac770d23f1ce44d0c43

SOURCES=$(MAIN).tex $(FIGURES) $(BIB)

$(MAIN).pdf $(MAIN).bcf: $(MAIN).tex $(SOURCES) img
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	rm -f $(MAIN).pdfsync
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out \
	*.fdb_latexmk *.synctex.gz *.synctex.gz\(busy\) *.lol *.xml
	rm -f $(MAIN)-blx.bib
	rm -f $(MAIN)_embed.pdf
	rm *.spl


diff: diff-with-original-submission.pdf

diff-with-original-submission.pdf: diff-with-original-submission.tex
	latexmk -f -pdf -pdflatex="pdflatex -interaction=nonstopmode" -use-make $<


diff-with-original-submission.tex: $(MAIN).tex
	rm -f $(MAIN)-diff$(DIFFHASH)-HEAD.tex
	latexdiff-git --flatten -r $(DIFFHASH) -r HEAD $<
	mv $(MAIN)-diff$(DIFFHASH)-HEAD.tex $@


clean-diff:
	rm diff.*

count: 
	texcount $(MAIN).tex

simple-diff:
	latexdiff original_manuscript.tex causal_decision_making.tex  > diff.tex

zip-sources:
	zip -r latex-sources.zip causal_decision_making.tex causal_decision_making.bbl causal_decision_making.pdf references.bib img_main/* img_supp/*

.PHONY: all clean watch count

