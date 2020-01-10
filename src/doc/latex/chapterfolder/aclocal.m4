# aclocal.m4 generated automatically by aclocal 1.6.3 -*- Autoconf -*-

# Copyright 1996, 1997, 1998, 1999, 2000, 2001, 2002
# Free Software Foundation, Inc.
# This file is free software; the Free Software Foundation
# gives unlimited permission to copy and/or distribute it,
# with or without modifications, as long as this notice is preserved.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY, to the extent permitted by law; without
# even the implied warranty of MERCHANTABILITY or FITNESS FOR A
# PARTICULAR PURPOSE.

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_PROG_LATEX
#
# Test for latex or elatax or lambda
# and set $latex to the correct value.
#
#
dnl @synopsis AC_PROG_LATEX
dnl
dnl This macro test if latex is installed. If latex
dnl is installed, it set $latex to the right value
dnl
dnl @version 1.1
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_PROG_LATEX],[
AC_CHECK_PROGS(latex,[latex elatex lambda],no)
export latex;
if test $latex = "no" ;
then
	AC_MSG_ERROR([Unable to find a LaTeX application]);
fi
AC_SUBST(latex)
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_PROG_TEXHASH
#
# Test for texhash
# and set $texhash to the correct value.
#
#
dnl @synopsis AC_PROG_TEXHASH
dnl
dnl This macro test if texhash is installed. If texhash
dnl is installed, it set $texhash to the right value
dnl
dnl @version 1.2
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_PROG_TEXHASH],[
AC_CHECK_PROGS(texhash,[texhash],no)
export texhash;
if test $texhash = "no" ;
then
	AC_MSG_ERROR([Unable to find the texhash application]);
fi
AC_SUBST(texhash)
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_PROG_KPSEWHICH
#
# Test for kpsewhich
# and set $kpsewhich to the correct value.
#
#
dnl @synopsis AC_PROG_KPSEWHICH
dnl
dnl This macro test if kpsewhich is installed. If kpsewhich
dnl is installed, it set $kpsewhich to the right value
dnl
dnl @version 1.2
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_PROG_KPSEWHICH],[
AC_CHECK_PROGS(kpsewhich,[kpsewhich],no)
export kpsewhich;
if test $kpsewhich = "no" ;
then
	AC_MSG_ERROR([Unable to find the kpsewhich application]);
fi
AC_SUBST(kpsewhich)
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_LATEX_PACKAGE(<packagen>],<class>,<variable>)
#
# Test the presences of package and set $<variable> 
# to yes or no
#
#
dnl @synopsis AC_LATEX_PACKAGE(<package>,<class>,<variable>)
dnl
dnl This macro test if package in <class> exists
dnl and set <variable> to the right value
dnl
dnl  AC_LATEX_PACKAGE(varioref,book,vbook)
dnl  should set $vbook="yes"
dnl
dnl  AC_LATEX_PACKAGE(xyz,book,vbook)
dnl  should set $vbook="no"
dnl
dnl @version 1.1
dnl @author Mathieu Boretti boretti@bss-network.com
dnl

AC_DEFUN([AC_LATEX_PACKAGE],[
if test "$[ac_cv_latex_class_]translit($2,[-],[_])" = "" ;
then
	AC_LATEX_CLASS($2,boretti_classesansparametre)
	export boretti_classesansparametre;
else
	boretti_classesansparametre=$[ac_cv_latex_class_]translit($2,[-],[_]) ;
	export boretti_classesansparemetre;
fi;
if test $boretti_classesansparametre = "no" ;
then
    AC_MSG_ERROR([Unable to find $2 class])
fi
AC_CACHE_CHECK([for $1 in class $2],[ac_cv_latex_]translit($1,[-],[_])[_]translit($2,[-],[_]),[
_AC_LATEX_TEST([
\documentclass{$2}
\usepackage{$1}
\begin{document}
\end{document}
],[ac_cv_latex_]translit($1,[-],[_])[_]translit($2,[-],[_]))
])
$3=$[ac_cv_latex_]translit($1,[-],[_])[_]translit($2,[-],[_]); export $3;
AC_SUBST($3)
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_LATEX_CLASS(<class>,<variable>)
#
# Test the presences of class and set $<variable> 
# to yes or no
#
#
dnl @synopsis AC_LATEX_CLASSE(<class1>,<var>)
dnl
dnl Test if class1 exists
dnl and set $var to the right value
dnl
dnl  AC_LATEX_CLASSES([book],book)
dnl  should set $book="yes"
dnl
dnl  AC_LATEX_CLASSES(allo,book)
dnl  should set $book="no"
dnl
dnl @version 1.1
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_LATEX_CLASS],[
AC_CACHE_CHECK([for class $1],[ac_cv_latex_class_]translit($1,[-],[_]),[
_AC_LATEX_TEST([
\begin{document}
\end{document}
],[ac_cv_latex_class_]translit($1,[-],[_]),$1)
])
$2=$[ac_cv_latex_class_]translit($1,[-],[_]) ; export $2;
AC_SUBST($2)
])
#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# Internal macro to test a latex file
#

AC_DEFUN([_AC_LATEX_TEST],[
AC_REQUIRE([AC_PROG_LATEX])
rm -rf .tmps_latex 
mkdir .tmps_latex 
cd .tmps_latex 
ifelse($#,2,[
$2="no"; export $2;
cat > testconf.tex << \EOF
$1
EOF
],$#,3,[
echo "\\documentclass{$3}" > testconf.tex
cat >> testconf.tex << \EOF
$1
EOF
],$#,4,[
echo "\\documentclass{$3}" > testconf.tex
echo "\\usepackage{$4}" > testconf.tex
cat >> testconf.tex << \EOF
$1
])
cat testconf.tex | $latex 2>&1 1>/dev/null && $2=yes; export $2;
cd .. 
rm -rf .tmps_latex 
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_TEXMF_PATH
#
# Test for a local texmf path
# and set $texmfpath to the correct value.
#
#
dnl @synopsis AC_TEXMF_PATH
dnl
dnl This macro test for a local texmf path and
dnl set $texmfpath to the correct value
dnl
dnl @version 1.1
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_TEXMF_PATH],[
AC_ARG_WITH([texmf-path],AC_HELP_STRING([--with-texmf-path=...],[specify default local texmf path]),[
    if test ! "$withval" = "yes" ;
    then
        ac_cv_texmf_path="$withval" ; export ac_cv_texmf_path;
    fi;
],[
    texmfpath=""; export texmfpath;
])
AC_REQUIRE([AC_PROG_LATEX])
AC_REQUIRE([AC_PROG_AWK])
AC_REQUIRE([AC_LATEX_CLASS_REPORT])
AC_CACHE_CHECK([for texmf local path],[ac_cv_texmf_path],[
    Base=`$kpsewhich report.cls` ; export Base ;
    Base=`echo $Base | $AWK -F / '{for(i=1;i<NF;i++) {if ($i=="texmf") break; OUT=OUT$i"/";} print OUT}'` ; export Base ;
    if test -x "$Base/texmf.local" ; 
    then
        Base="$Base/texmf.local" ; export Base;
    else
        if test -x "$Base/texmf-local" ;
        then
            Base="$Base/texmf-local" ; export Base;
        else
            if test -x "$Base/texmf" ; 
            then
                Base="$Base/texmf" ; export Base;
            else
                Base="no"; export Base;
            fi;
        fi;
    fi;
    ac_cv_texmf_path="$Base" ; export ac_cv_texmf_path;
])
texmfpath=$ac_cv_texmf_path ; export texmfpath;
if test "$texmfpath" = "no" ;
then
    AC_MSG_ERROR([Unable to find a local texmf folder. Use --with-texmf-path=... to specify it])
fi
AC_SUBST(texmfpath)
])

#
#   Copyright (C) 2004  Boretti Mathieu
#
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#
# AC_LATEX_CLASS_REPORT
#
# Test the presences class report and
# set report to yes if exists, 
# else Error
#
#
dnl @synopsis AC_LATEX_CLASS_REPORT
dnl
dnl same as AC_LATEX_CLASS(report,report)
dnl
dnl @version 1.1
dnl @author Mathieu Boretti boretti@bss-network.com
dnl
AC_DEFUN([AC_LATEX_CLASS_REPORT],[
AC_LATEX_CLASS(report,report)
if test $report = "no";
then
    AC_MSG_ERROR([Unable to find the report class])
fi
])
