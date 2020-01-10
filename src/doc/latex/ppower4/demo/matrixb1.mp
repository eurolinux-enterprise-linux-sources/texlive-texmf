%
% fig2dev (version 3.2.4-beta1) -L (m)mp version 0.06 --- Preamble
%

%
% mp output driver options:
%  -L mp
%

% +MP-ADDITIONAL-HEADER
verbatimtex
%&latex
\documentclass{article}
\begin{document}
etex
% -MP-ADDITIONAL-HEADER


%SetFigFont macros for latex
verbatimtex
%
\begingroup\makeatletter\ifx\SetFigFont\undefined%
\gdef\SetFigFont#1#2#3#4#5{%
  \reset@font\fontsize{#1}{#2pt}%
  \fontfamily{#3}\fontseries{#4}\fontshape{#5}%
  \selectfont}%
\fi\endgroup%
\ifx\SetFigFontSize\undefined%
\gdef\SetFigFontSize#1#2{%
  \fontsize{#1}{#2pt}%
  \selectfont}%
\fi%
etex

% Make arrowheads mitered by default
% NOTE: subject to change (edited from plain.mp)
    def forwarr(text t) expr p =
      _apth:=p;_finarrf(t)
    enddef;
    def backarr(text t) expr p =
      _apth:=p;_finarrb(t)
    enddef;
    def _finarrf(text s) text t =
      if (s=0):fill arrowhead _apth  t withcolor white
      else: fill arrowhead _apth  t fi;
      linejoin:=0;
      draw arrowhead _apth  t
    enddef;
    def _finarrb(text s) text t =
      if (s=0):fill arrowhead reverse _apth  t withcolor white
      else: fill arrowhead reverse _apth  t fi;
      linejoin:=0;
      draw arrowhead reverse _apth  t
    enddef;


% Now draw the figure
beginfig(0)
% Some reasonable defaults
  ahlength:=7;
  ahangle:=30;
  labeloffset:=0;
  truecorners:=1;
  bboxmargin:=0;
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (166.50,742.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((166.50,739.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (166.50,760.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((166.50,757.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (166.50,715.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((166.50,712.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (148.50,742.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((148.50,739.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (166.50,697.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((166.50,694.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (121.50,697.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((121.50,694.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (103.50,715.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((103.50,712.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (103.50,697.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((103.50,694.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.00 yscaled 1.00
         rotated 0.00 shifted (103.50,679.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((103.50,676.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.00 yscaled 1.00
         rotated 0.00 shifted (121.50,679.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((121.50,676.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.00 yscaled 1.00
         rotated 0.00 shifted (148.50,679.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((148.50,676.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.00 yscaled 1.00
         rotated 0.00 shifted (166.50,679.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((166.50,676.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.00 yscaled 1.00
         rotated 0.00 shifted (148.50,697.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((148.50,694.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (121.50,715.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (148.50,715.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (103.50,697.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (121.50,697.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (148.50,742.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (166.50,742.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (166.50,760.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 12.72 yscaled 1.00
         rotated 0.00 shifted (148.50,760.50);
  draw c withcolor (0.00,0.69,0.00);
% End ellipse object
% Begin ellipse object
  pickup pencircle scaled 0.90;
  path c;
  c = fullcircle scaled 10.80 yscaled 1.00
         rotated 0.00 shifted (148.50,760.50);
  draw c withcolor (0.00,0.00,0.69);
% End ellipse object
% Begin polyline object
  linecap:=0;
  linejoin:=0;
  pickup pencircle scaled 0.90;
  path p;
  p = (90.00, 729.00)
    --(135.00, 729.00)
    --(135.00, 666.00)
    --(90.00, 666.00)
    --(90.00, 729.00)--cycle;
  draw p withcolor (0.00,0.00,0.00);
% End polyline object
% Begin polyline object
  linecap:=0;
  linejoin:=0;
  pickup pencircle scaled 0.90;
  path p;
  p = (135.00, 729.00)
    --(180.00, 729.00)
    --(180.00, 666.00)
    --(135.00, 666.00)
    --(135.00, 729.00)--cycle;
  draw p withcolor (0.00,0.00,0.00);
% End polyline object
% Begin polyline object
  linecap:=0;
  linejoin:=0;
  pickup pencircle scaled 0.90;
  path p;
  p = (135.00, 774.00)
    --(180.00, 774.00)
    --(180.00, 729.00)
    --(135.00, 729.00)
    --(135.00, 774.00)--cycle;
  draw p withcolor (0.00,0.00,0.00);
% End polyline object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((121.50,712.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((148.50,712.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $*$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((148.50,757.80))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $B$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((130.50,751.50))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $A$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((85.50,693.00))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt $C$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((184.50,693.00))+llcorner p) withcolor (0.00,0.00,0.00);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt nach Algorithmus $A_1$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((135.00,648.00))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.00,0.69);
% End text object
% Begin text object
  picture q;
  verbatimtex
   \def\mpsetfnt{%
       \SetFigFontSize{10}{13.0}%
    }%
  etex;
  q = btex \mpsetfnt nach Algorithmus $A_2$ etex;
  picture p;
  p = q rotated 0.00;
  label.urt(p,((135.00,630.00))+xpart (lrcorner q - llcorner q)*(-cosd 0.00,-sind 0.00)/2+llcorner p) withcolor (0.00,0.69,0.00);
% End text object
endfig;
end
