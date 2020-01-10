\psset{unit=.825cm}
\begin{pspicture}(10,8)
  \psset{fillstyle=solid,linestyle=none,linewidth=0}
  \psframe[fillcolor=lightblue](10,8)
  \pscircle[fillcolor=yellow](2,6){.8} % Sun
  {% Rays
   \psset{linecolor=yellow,linestyle=solid,linewidth=.3}
   \degrees[8]
   \multido{\i=1+1}{8}{\rput{\i}(2,6){\psline(1,0)(1.5,0)}}
  }%

  \pspolygon[fillcolor=green](6,0)(10,2)(10,0)% Grass
  \psdiamond[fillcolor=red,gangle=-45](8,6)(1.5,2.5)% Kite
  \rput{45}(8,6){\pnode(-2.5,0){Kitetail}}
  \rput{-10}(.8,1.5){\psdiamond[fillcolor=yellow](.6,.1)(.6,.3)}
  \rput{-80}(.8,1.5){\psdiamond[fillcolor=yellow](.6,.1)(.6,.3)}
  \pnode(.8,1.5){Tailend}
  \nccurve[fillstyle=none,angleA=270,angleB=125,ncurvB=.9,ncurvA=1.4,
           linestyle=dotted,dotstyle=square,linewidth=.25]{Kitetail}{Tailend}
  \newcommand{\bunting}{\pstriangle(.35,.35)}
  \psset{fillcolor=red,labelsep=.01}
  \naput[nrot=115,npos=.15]{\bunting}
  \nbput[nrot=25,npos=.15]{\bunting}
  \naput[nrot=75,npos=.4]{\bunting}
  \nbput[nrot=115,npos=.4]{\bunting}
  \naput[nrot=115,npos=.7]{\bunting}
  \nbput[nrot=25,npos=.7]{\bunting}
\end{pspicture}
