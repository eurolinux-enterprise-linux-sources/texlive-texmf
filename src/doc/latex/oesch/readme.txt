%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                               %
%  readme.txt                                                                   %
%                                                                               %
%  Oesterreichische Schulschrift 1995 (Austrian School Writing Letters 1995)    %
%  Version May 18, 2001                                                         %
%                                                                               %
%  Design by Gerhard A. Bachmaier                                               %
%                                                                               %
%  Email:      gerhard.bachmaier@uni-graz.at                                    %
%                                                                               %
%  You're free to use or copy this file as long as you leave this               %
%  header intact and don't change the contents.                                 %
%                                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

This METAFONT files will generate a font which is used in Austrian schools for
hand writing. There are two sizes, 10pt and 20pt.

The Austrian School Writing Font differs from german hand writing fonts in many
details; e.g. you have to continue lowercase letters at the middle bar after
capital letters F,H, and Z.

The font contains all letters including a sharp s, digits, a few typographic 
characters .,;:()!? german quotes, and dashes. There is just one accent (umlaut).
This should be sufficient for german and english texts.

Additionally are some letter variants for ligatures. In normal circumstances you
will NOT need any explicit use of them. The ligtables in the font will do the
job for you.

The font is based on the newer T1 encoding and can handle ligatures with umlaut
accent. All accented letters (also lowercase \"e and \"i) are contained as 
glyphs.

Umlaut accent can be applied in 3 different ways:
.) (sure one) as e.g. \"a
.) e.g. "a (without \) works without the package german in the text environment,
because the ligatures "a,"o,"u,"A,"O,"U,"s,"`,"``,"', and "'' are part of the font.
If you have umlaut accents in normal text use the package german and accents are
correct in both environments. Just quotes will not work, since the package german
assumes OT1-fonts(!). Use \gsqon/\gsqoff or \gqon/\gqoff respectively.
.) Windows texts with ä,ö,ü,Ä,Ö, and Ü will be treated correct in the text environment,
just ß (sharp-s) will not work. This is not possible for normal (Computer Modern) text.

Most special characters can be used by an extra command:
\i  \j        dotless i or j 
\ii \jj       dotless i or j  (variant in combination with FHZ)
\ae \oe \ue   variant umlaut accent lowercase letters in combination with FHZ
\B \D \I \N \O \Oe \P \S \T \V \W  capital letters with starting small dash
\x \r         special characters used at the beginning of a word
\s            final s (normal s has an extra dash)
\Fe \He \Ze \Pf ligatures    

Files:
oesch.sty          Package oesch
oe.def             Encoding oe 
oesch.mf           Metafont file option 10pt 
oeschb.mf          Metafont file option 20pt 
oesch_m.mf         Metafont main file 
lig.mf             ligtables 
readme.txt         this file
liesmich.txt       readme.txt in german
beispiel.tex       example.tex in german
example.tex        example

Installation:
Put oesch.sty and oe.def into a directory, where LaTeX will look for them e.g. TeX/LaTex/misc
Put *.mf into a directory, where MetaFont will look for them e.g. fonts/source/public/misc.

Usage:
For short examples use \textoesch{Text}. Long texts use \oeschfamily
or \oeschbfamily. Furthermore I recommend to use it with
\renewcommand{\baselinestretch}{1.4}.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                                 %
%  End of File                                                                    %
%                                                                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
