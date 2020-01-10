% mmtable.mm -- table of malayaaLam script
% copyright 1992 Jeroen Hellingman
% last edit: 25-DEC-1992

\input mmmacs
\input mmtrmacs
\input mmphmacs

\parindent=0pt

\centerline{\twelvebf Table of Malayalam letters with transcription}

\bigskip

\def\q{\quad\hfill}
\def\col#1#2{\hbox{\vtop{\hsize=#1\raggedright\tolerance=10000#2}}}
\def\malstrut{\vtop to4pt{}\vbox to10pt{}}
\halign{\malstrut\twelvemmr#\q&\twelvemmr#\q&\tt#\q&#\q&#\q&\col{4cm}{#}\q\cr
\col{1.75cm}{normal character shape}        &
\col{1.75cm}{secondary form}                &
\col{1.75cm}{\rm ASCII transcription}       &
\col{1.75cm}{scientific transcription}      &
\col{4cm}{remark}                       \cr
\noalign{\hrule}
$a$         &           & a         & $$a$$             & $$a$$ is inherent in consonants. \cr
$aa$        & $[]<<aa$  & aa        & $$aa$$			\cr
$i$         & $[]<<i$   & i         & $$i$$             \cr
$ii$        & $[]<<ii$  & ii        & $$ii$$			& older form: $MraM$, $M[]M$.   \cr
$u$         & $[]<<u$   & u         & $$u$$             & irregular secundary shape.    \cr
$uu$        & $[]<<uu$  & uu        & $$uu$$			& idem.                         \cr
$.r$        & $[]<<.r$  & .r        & $$.r$$ (\r{r})    & used in Sanskrit loan words.  \cr
$.r.r$      & $[]<<.r.r$& .r.r      & $$.r.r$$ (\r{\=r}) & only used in a few Sanskrit words. \cr
$.l$        & $[].l$    & .l        & $$.l$$ (\r{l})    & idem.                         \cr
$.l.l$      & $[].l.l$  & .l.l      & $$.l.l$$ (\r{\=l}) & not used in any word at all. \cr
$e$         & $[]<<e$   & e         & $$e$$             \cr
$ee$        & $[]<<ee$  & ee        & $$ee$$			\cr
$ai$        & $[]<<ai$  & ai        & $$ai$$            \cr
$o$         & $[]<<o$   & o         & $$o$$             \cr
$oo$        & $[]<<oo$  & oo        & $$oo$$			\cr
$au$        & $[]<<au$  & au        & $$au$$            & now normally written $[]<<au"$, ({\tt au"}). \cr
\noalign{\hrule}
$aM$     &   $[]M$      & aM	    & $$aM$$ ({\mmph a\m})  & anusvara, or $muRakkaM$.      \cr
$aH$     &   $[]H$      & aH        & $$aH$$        & visarga, or $visarggaM$.      \cr
\noalign{\hrule}
$ka$        & $[]<<ka$  & ka        & $$ka$$            \cr
$kha$       &           & kha       & $$kha$$           \cr
$ga$        &           & ga        & $$ga$$            \cr
$gha$       &           & gha       & $$gha$$           \cr
$n"a$       &           & n"a       & $$n"a$$ ({\mmph \ng a}) \cr
\noalign{\hrule}
$ca$        &           & ca        & $$ca$$ (\v ca)    \cr
$cha$       &           & cha       & $$cha$$ (\v cha)  \cr
$ja$        &           & ja        & $$ja$$ (\v\j a)   \cr
$jha$       &           & jha       & $$jha$$ (\v\j ha) \cr
$n~a$       &           & n\~{}a    & $$n~a$$ ({\mmph\ny a})    \cr
\noalign{\hrule}
$Ta$        &           & Ta        & $$Ta$$ ({\mmph\tt a})     \cr
$Tha$       &           & Tha       & $$Tha$$ ({\mmph\tt ha})   \cr
$Da$        &           & Da        & $$Da$$ ({\mmph\dd a})     \cr
$Dha$       &           & Dha       & $$Dha$$ ({\mmph\dd ha})   \cr
$Na$        &           & Na        & $$Na$$ ({\mmph\nn a})     \cr
\noalign{\hrule}
$ta$        &           & ta		& $$ta$$   		\cr
$tha$       &           & tha       & $$tha$$       \cr
$da$        &           & da        & $$da$$        \cr
$dha$       &           & dha       & $$dha$$       \cr
$na$        &           & na, n\_a  & $$na, n_a$$ (\v na) \cr
\noalign{\hrule}
$pa$        &           & pa        & $$pa$$        \cr
$pha$       &           & pha, fa   & $$pha$$, $$fa$$ \cr
$ba$        &           & ba        & $$ba$$        \cr
$bha$       &           & bha       & $$bha$$       \cr
$ma$        &           & ma        & $$ma$$        \cr
\noalign{\hrule}
$ya$        & $[]<<ya$  & ya        & $$ya$$        \cr
$ra$        & $[]<<ra$  & ra        & $$ra$$        & primary shape: $r<<[]$            \cr
$Ra$        & $[]<<Ra$  & Ra, t\_a  & $$Ra$$ (\v ra, \dd ra), $$t_a$$ & $valiya Ra$, `large $$Ra$$'.     \cr
$RRa$       &           & RRa, t\_t\_a & $$RRa$$    \cr
$la$        & $[]<<la$  & la        & $$la$$        \cr
$va$        & $[]<<va$  & va        & $$va$$        \cr
$sha$       &           & sha       & $$sha$$ (sha, {\mmph\sh a})   & $ciRiya sha$, `small $$sha$$'.    \cr
$Sa$        &           & Sa        & $$Sa$$ ({\mmph\ss a})     & $valiya Sa$, `large $$Sa$$'.      \cr
$sa$        &           & sa        & $$sa$$        \cr
$ha$        &           & ha        & $$ha$$        \cr
$La$        &           & La        & $$La$$ ({\mmph\ll a})     & $valiya La$, `large $$La$$'.      \cr
$zha$       &           & zha       & $$zha$$ (\dd la, {\mmph\rr a}) \cr
\noalign{\hrule}
            & $[]<<+$   & +         &               & virama, or $candrakala$, `cresent'. \cr
            & $[]<<u+$  & u+        & $$u+$$ (\.u, {\mmph\u})       & half $$u+$$, or $arayukaram$. \cr
\noalign{\hrule}
$0$         &           & 0         & 0             \cr
$1$         &           & 1         & 1             \cr
$2$         &           & 2         & 2             \cr
$3$         &           & 3         & 3             \cr
$4$         &           & 4         & 4             \cr
$5$         &           & 5         & 5             \cr
$6$         &           & 6         & 6             \cr
$7$         &           & 7         & 7             \cr
$8$         &           & 8         & 8             \cr
$9$         &           & 9         & 9             \cr
\noalign{\hrule}
            &           & <<        &               & join. \cr
            &           & >>        &               & non-join. \cr
$[]$        &           & []        & $$[]$$        & dotted circle. \cr
            &           & >         &               & disambiguating character.     \cr
}

\bye
