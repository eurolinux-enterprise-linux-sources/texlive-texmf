all: distclean sample sample_eps ttf-tetex.pdf htm install


ttf-tetex.pdf:
	pdflatex ttf-tetex
	bibtex ttf-tetex
	pdflatex ttf-tetex
	thumbpdf --verbose ttf-tetex
	pdflatex ttf-tetex


sample_eps:
	latex sample_eps
	dvips -E -Pvagrounded sample_eps
	epstopdf sample_eps.ps

sample:
	latex sample
	latex sample
	dvips -Pvagrounded sample

htm:
	rm -f html/*
	latex2html -split 0 -show_section_numbers -local_icons -no_navigation -image_type gif -dir html/ ttf-tetex

install:
	cp Makefile fonts.bib ttf-tetex.tex sample_eps.tex html/
	cp sample_eps.ps sample_eps.pdf sample.tex sample.ps html/
	cp ttf2type1 vagrounded.map config.vagrounded html/
	cp ttf-tetex.pdf html/
	cp vagrounded.sty html/
	-rm -f html/*.log html/*.out html/*.pl html/*.aux html/*.bbl 
	-rm -f html/images.tex html/WARNINGS

clean:
	-rm -f sample.dvi sample.log sample.aux 
	-rm -f sample_eps.dvi sample_eps.log sample_eps.aux
	-rm -f ttf-tetex.aux ttf-tetex.bbl ttf-tetex.blg ttf-tetex.dvi \
		ttf-tetex.log ttf-tetex.out ttf-tetex.toc ttf-tetex.tpt
	-rm -f html/WARNINGS html/images.pl html/labels.pl html/images.log \
		html/images.aux html/images.bbl html/images.tex \
		html/internals.pl

distclean: clean
	-rm -f html/*
	-rm -f sample.ps sample_eps.pdf sample_eps.ps
	-rm -f ttf-tetex.pdf ttf-tetex.ps 
