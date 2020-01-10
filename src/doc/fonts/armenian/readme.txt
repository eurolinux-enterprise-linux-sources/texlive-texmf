           ArmTeX,      Version 2.0,      1st June 1999


1. Description 

ArmTeX is an Armenian system for TeX/LaTeX(2e)/METAFONT.  It can
be used with standard Latin keyboard without any special encoding
and/or support for Armenian letters.  It can also be used with
any keyboard which uses encoding having Armenian letters in
the second half (characters 128-255) of extended ASCII table
(for example ArmSCII8 Armenian standard).

This is a freeware system by S. Dachian, A. Dalalyan
and V. Hakobian.

Feel free to give copies of this system to your friends, and be
sure to include ALL the files, including this and other text files.
Feel also free to use our code for producing your own software.
But don't ever change and/or alter the ArmTeX system without our
special permission.

If you have any questions you can contact us via e-mail at:

Serguei.Dachian@univ-lemans.fr
dalalyan@lx2.yerphi.am
vakopian@usc.edu



2. Installation

  a) If you are upgrading from ArmTeX 1.0, you should first
"uninstall" it, since the changes from version 1.0 to 2.0 are
important (see also ArmTeX manual).  Not only some files were
changed, some old files removed and some new files added, but
also transcription scheme was modified, so that a slight
(re)editing of your own documents typed with ArmTeX 1.0 is
necessary.  So, first remove all the files related to ArmTeX 1.0
(the files which are part of it, as well as, say, "generated"
"pk" files) and be sure to read about changes of transcription
scheme in ArmTeX manual.

  b) Put files from "mf" directory somewhere your METAFONT can
find them (generally this is something like "mfinput" or "source"
directory; refer to your METAFONT release manual or ask a
local guru).

  c) Put files from "tfm" directory somewhere your METAFONT can
find them (generally this is something like "tfm" directory;
refer to your METAFONT release manual or ask a local guru).

  d) Put files from "plain" directory somewhere your TeX compiler
(in plain mode) can find them (generally this is something like
"texinput" or "plain" directory; refer to your TeX release manual
or ask a local guru).

  e) Put files from "latex" directory somewhere your TeX compiler
(in LaTeX2e mode) can find them (generally this is something like
"latexinput" or "latex" directory; refer to your TeX release manual
or ask a local guru).

Now everything is ready, and you should be able to compile the
example and documantation files from "examples" directory.  The
latter contains two subdirectories: "plain" and "latex".  The
files from the first one should be compiled with plain TeX
(usually "tex" command), and the files from the second one should
be compiled with LaTeX2e (usually "latex" command).

To type your own documents (in Plain TeX or LaTeX) read the ArmTeX
manual (in Armenian).  It is in the "manual.tex" file from "latex"
subdirectory of "examples" directory.  Its PostScript version
("manual.ps") is also included in ArmTeX 2.0 (it is in the root
directory of the distribution, along with this "readme.txt" file)
in the case you want to see the manual before installation [or you
don't have LaTeX2e:-)].



3. About fonts

The ArmTeX system includes two families of fonts:

  a) artmr10, artmsl10, artmi10, artmb10, artmbs10 and artmbi10:
Serif font (something like Times New Roman or Computer Modern Roman)
with its Slanted, Italic, Bold, BoldSlanted and BoldItalic versions.

These fonts were converted from the TrueType font family
"ArTarumianTimes" made by Ruben Hakobian(Tarumian).  We would
like to thank him for giving us the permission to use his fonts.

  b) arssr10, arsssl10, arssb10 and arssbs10: Sans Serif font
(something like Arial or Computer Modern Sans Serif) with its
Slanted, Bold and BoldSlanted versions.

These fonts were converted from the PostScript font "Sassoun".
This font was originally created and released as "Sassoun" (c) 1994
Raffi Kojian (n_w$$h).  It is freeware, and can be found at
http://www.cilicia.com/armo8.html with complete documentation.  Any
alteration for release must be cleared by Raffi.  We would like once
more to thank Raffi for giving us the permission to use his font.



4. Known problems

The spacing and kerning of the fonts may not always look very good
(especially when the Armenian intonation signs are involved).
Actually, using 128-long encoding OT6 it seems difficult to
do better.  The 256-long encoding T6 is reserved for future
releases of ArmTeX which will include and Armenian and Latin
characters in the font, as well as some "accented" symbols to
solve spacing and kerning problems.

If you have any other problem [normally you shouldn't ;-)] don't
hesitate to contact us.  Any bug reports and/or suggestions for
improving the ArmTeX are welcome.  Our e-mail addresses are:

Serguei.Dachian@univ-lemans.fr
dalalyan@lx2.yerphi.am
vakopian@usc.edu
