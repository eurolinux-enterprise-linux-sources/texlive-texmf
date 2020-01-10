rem This file is not tested due to not having DOS or Windows

rem Generate package file
latex isodate.ins
latex isodateo.ins

rem Generate documentation
latex isodate.dtx
latex isodate.dtx
makeindex -s gind.ist isodate
makeindex -s gglo.ist -o isodate.gls isodate.glo
latex isodate.dtx
dvips -o isodate.ps isodate
del isodate.glo 
del isodate.gls
del isodate.idx
del isodate.ilg
del isodate.ind
del isodate.aux
del isodate.log
del isodate.toc

latex isodateo.dtx
latex isodateo.dtx
makeindex -s gind.ist isodateo
makeindex -s gglo.ist -o isodateo.gls isodateo.glo
latex isodateo.dtx
dvips -o isodateo.ps isodateo
del isodateo.glo 
del isodateo.gls
del isodateo.idx
del isodateo.ilg
del isodateo.ind
del isodateo.aux
del isodateo.log
del isodateo.toc

rem Generate example
latex testdate
dvips -o testdate.ps testdate
del testdate.aux
del testdate.log

rem test the package
latex tstlang

echo .
echo .
echo "Please copy isodate.sty, *.idf, and isodateo.sty to a directory"
echo "in the LaTeX search path"
