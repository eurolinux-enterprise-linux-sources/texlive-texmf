#!/bin/sh
if [ -z `kpsewhich substr.sty` ]
then
    echo
    echo "Error installing isodate:"
    echo "This version of isodate needs the package substr.sty"
    echo "which cannot be found in your system."
    echo
    echo "Please download it from CTAN:/macros/latex/contrib/supported/substr/."
    echo "One of the possible CTAN nodes is ftp.dante.de."
    echo "Try to execute install.sh after installing substr.sty again."
    echo
    exit
fi

# Generate package files
latex isodate.ins
latex isodateo.ins

# Generate documentation
latex isodate.dtx
latex isodate.dtx
makeindex -s gind.ist isodate
makeindex -s gglo.ist -o isodate.gls isodate.glo
latex isodate.dtx
dvips -o isodate.ps isodate
rm isodate.{glo,gls,idx,ilg,ind,aux,log,toc}

latex isodateo.dtx
latex isodateo.dtx
makeindex -s gind.ist isodateo
makeindex -s gglo.ist -o isodateo.gls isodateo.glo
latex isodateo.dtx
dvips -o isodateo.ps isodateo
rm isodateo.{glo,gls,idx,ilg,ind,aux,log,toc}

# Generate example
latex testdate
dvips -o testdate.ps testdate
rm testdate.{aux,log}

# test the package
latex tstlang

echo
echo
echo "Please copy isodate.sty, *.idf, and isodateo.sty to a directory"
echo "in the LaTeX search path"
