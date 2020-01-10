input=pst-code

all:
	$(MAKE) dvi
	$(MAKE) ps
	$(MAKE) pdf

index:
	makeindex -s gind.ist $(input).idx

dvi:
	latex $(input).tex
	$(MAKE) index
	latex $(input).tex
	xdvi $(input).dvi

ps:
	latex $(input).tex
	$(MAKE) index
	latex $(input).tex
	dvips $(input)
	gv $(input).ps

pdf:
	pdflatex $(input).tex
	$(MAKE) index
	pdflatex $(input).tex
	xpdf $(input).pdf


zip:
	$(RM) $(input).zip
	zip -r $(input).zip *

clean:
	$(RM) *.pdf
	$(RM) *.ps

