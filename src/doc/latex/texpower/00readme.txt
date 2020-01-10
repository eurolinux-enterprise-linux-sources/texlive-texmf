======================================================================

			   TeXPower bundle
	   Creating dynamic online presentations with LaTeX

			 alpha version (v0.1)
	    This readme file last changed on July 26, 2004

Developers: Stephan Lehmke <mailto:Stephan.Lehmke@cs.uni-dortmund.de>
	    Lehrstuhl Informatik I
	    Universität Dortmund
	    Dortmund, Germany

	    Hans Fr. Nordhaug <mailto:hans@nordhaug.priv.no>
	    Molde, Norway

======================================================================

   TeXPower is a bundle of packages intended to provide
   an `all-inclusive' environment for designing pdf
   `screen presentations' to be viewed with Adobe Acrobat[tm]
   reader in full-screen mode, especially for projecting
   `online' with a video beamer.
   
   The features provided include:
   
   * `dynamic' features like incremental building of pages,
     animated diagrams and such.
     
   * support for `navigation panels'
   
   * support for page backgrounds
   
   * advanced color management (`logical markup' for colors supplying
     `color sets' for different background colors, `dimming' and inverting
     of colors etc.) and color highlighting.
     
   * advanced font configuration.

======================================================================

The TeXPower project homepage is located at SourceForge:

 <http://texpower.sourceforge.net/>

The mailing list is also located at SourceForge:

 <http://lists.sourceforge.net/lists/listinfo/texpower-users>

======================================================================

Contents:
=========

So far, the bundle contains the following files and directories:


00readme.txt
	This file.

01install.txt
	Installation instructions.
        
Makefile
        Builds documentation and unpacks dtx-files.
        (Only useful on Unix-like systems.)

texpower.dtx  
        Documented TeX source for the texpower package.

powersem.dtx  
        Documented TeX source for the powersem class.

texpower-cfg.dtx  
        Configuration files for the texpower package.

texpower-addons.dtx  
        Documented TeX source for auxilliary packages and classes which use or
        augment the TeXPower bundle.

texpower-doc.dtx  
        TeX source for documentation, examples and demos for the TeXPower
        bundle. Compiled examples can be downloaded from
          <http://texpower.sourceforge.net/doc/>

tpbundle.ins
        Docstrip batchfile that generates all the files described below from the
        texpower dtx-files (described above).

tpslifonts (directory)
	Contains the tpslifonts package and an example.

contrib (directory)
        Contains some additions to the TeXPower bundle contributed by other people.
                
Generated files:
================

texpower.sty (from texpower.dtx)

	Implements commands for presentation effects. This includes 
	* color management and highlighting;
	* incremental displaying of pages;
	* navigation helpers;
	* setting page backgrounds and `panels'.

	The code should work with all ways of PDF creation.

tpcolors.cfg (from texpower-cfg.dtx)
tpoptions.cfg (from texpower-cfg.dtx)
tpsettings.cfg (from texpower-cfg.dtx)

	Configuration files for texpower.sty.

powersem.cls (from powersem.dtx)

	A wrapper for seminar which sets up everything for dynamic
	presentations. For this alpha version, it doesn't do much
	more than load seminar.cls and do some bug fixes.

	\documentclass{powersem} should be used as a replacement for
	\documentclass{seminar}. powersem loads seminar and passes all
	options to seminar.

automata.sty (from texpower-addons.sty)

        Experimental package for drawing automata in the sense of
        theoretical computer science (using PSTricks) and animating
        them with TeXPower.
        Only DFA and Mealy automata are supported so far.


fixseminar.sty (from texpower-addons.sty)

        A small fix to seminar in conjunction with pdf generation
        (respect magnification in page dimensions setting).


tplists.sty (from texpower-addons.sty)

        This package provides dynamic lists. Read the start of the file
        for documentation and an example.


tppstcol.sty (from texpower-addons.sty)

        A replacement for ``pstcol.sty'' with some quirks corrected.


tpsem-a4.sty (from texpower-addons.sty)

        An LaTeX2e-fied sem-a4.sty (part of seminar).

FAQ-display.tex / FAQ-printout.tex (from texpower-doc.dtx)

        Frequently asked questions (FAQ) for the TeXPower bundle.
        
manual.tex (from texpower-doc.dtx)
  
        Manual for the TeXPower bundle.

fulldemo.tex (from texpower-doc.dtx)

        Most examples in one file together with the manual.

*example.tex (from texpower-doc.dtx)

        Misc. examples for the TeXPower bundle.
        
*demo.tex (from texpower-doc.dtx)

        Misc. demos using the TeXPower bundle.

__TPpreamble.tex (from texpower-doc.dtx)

        Generic preamble used by most of the examples.
        
__TPcfg.tex (from texpower-doc.dtx)

        Configuration used in __TPpreamble.tex and the FAQ/manual.

__TPindexing.tex (from texpower-doc.dtx)

        Indexing support for the manual/fulldemo.

fig-#.mps (from texpower-doc.dtx)
   
        Figures (in Metapost postscript format) used in the examples/demos




======================================================================

Disclaimer:
===========

Beware. This is work in progress. Use only if you know what you're
doing. During the subsequent error correction and extension of the
functionality, the syntax and implementation of the macros are liable
to change. 

So far, the files themselves contain only scarce inline documentation,
as the code is too much of a moving target to make rigorous
documentation a sensible endeavour. As soon as this bundle is ready
for beta release, I will make fully documented dtx files.

======================================================================

License:
========

The TeXPower bundle is distributed under the GNU General Public license
<http://www.gnu.org/copyleft/gpl.html>.

