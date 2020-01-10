# Makefile for the Eplain demos.  This file is public domain.

PDFTEX          = pdftex
DVIPDFM         = dvipdfmx
TEXI2PDF        = texi2dvi --pdf


.PHONY: all pdftex dvipdfm dvips mostlyclean clean distclean maintainer-clean


all: pdftex dvipdfm dvips

#
# Documents which have to be processed with pdfTeX.
#
pdftex: xhyper.pdf lscommnt.pdf

xhyper.pdf: xhyper.tex ctan_lion_350x350.png
	PDFLATEX=$(PDFTEX) $(TEXI2PDF) xhyper.tex

lscommnt.pdf: lscommnt.tex
	PDFLATEX=$(PDFTEX) $(TEXI2PDF) lscommnt.tex

#
# Documents which have to be processed with dvipdfm(x).
#
dvipdfm:

#
# Documents which have to be processed with dvips.
#
dvips:


clean mostlyclean:
	rm -f xhyper.{aux,log} lscommnt.log

distclean: clean
	rm -f xhyper.pdf lscommnt.pdf

maintainer-clean: distclean
