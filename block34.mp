%
% block16.mp - Sixteen node FEM element
%
% $OpenPave$
%
% The contents of this file are subject to the Academic Development
% and Distribution License Version 1.0 (the "License"); you may not
% use this file except in compliance with the License.  You should
% have received a copy of the License with this file.  If you did not
% then please contact whoever distributed this file too you, since
% they may be in violation of the License, and this may affect your
% rights under the License.
%
% Software distributed under the License is distributed on an "AS IS"
% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
% the License for the specific language governing rights and
% limitations under the License.
%
% The Initial Developer of the Original Software is Jeremy Lea.
%
% Portions Copyright (C) 2006-2008 OpenPave.org.
%
% Contributor(s): Jeremy Lea <reg@openpave.org>.
%

verbatimtex
\documentclass[11pt]{optech}

\begin{document}
\fontfamily{\sfdefault}
\fontsize{6}{10}
\selectfont
etex

input optech.mp;

pickup pencircle scaled 0.18mm;
ahlength := 0.018*w;
numeric axis; axis = 1.2;
alpha := 0.05;
alphafill perspect(-axis,-axis,0)--perspect(-axis,0,0)--
     perspect(0,0,0)--perspect(0,-axis,0)--cycle;
alphafill perspect(0,-axis,-axis)--perspect(0,0,-axis)--
     perspect(0,0,axis)--perspect(0,-axis,axis)--cycle;
alphafill perspect(-axis,0,-axis)--perspect(0,0,-axis)--
     perspect(0,0,axis)--perspect(-axis,0,axis)--cycle;
alphafill perspect(-axis,axis,0)--perspect(-axis,0,0)--
     perspect(0,0,0)--perspect(0,axis,0)--cycle;
alphafill perspect(axis,-axis,0)--perspect(0,-axis,0)--
     perspect(0,0,0)--perspect(axis,0,0)--cycle;
alphafill perspect(0,axis,-axis)--perspect(0,0,-axis)--
     perspect(0,0,axis)--perspect(0,axis,axis)--cycle;
alphafill perspect(axis,0,-axis)--perspect(0,0,-axis)--
     perspect(0,0,axis)--perspect(axis,0,axis)--cycle;
alphafill perspect(axis,axis,0)--perspect(axis,0,0)--
     perspect(0,0,0)--perspect(0,axis,0)--cycle;
draw perspect(1.0,-1.0,0)--perspect(-1.0,-1.0,0) withcolor 0.3[white,opgreen];
draw perspect(-1.0,1.0,0)--perspect(-1.0,-1.0,0) withcolor 0.3[white,opgreen];
draw perspect(1.0,0,-1.0)--perspect(-1.0,0,-1.0) withcolor 0.3[white,opgreen];
draw perspect(0,1.0,-1.0)--perspect(0,-1.0,-1.0) withcolor 0.3[white,opgreen];
draw perspect(0,-1.0,-1.0)--perspect(0,-1.0,1.0) withcolor 0.3[white,opgreen];
draw perspect(-1.0,0,-1.0)--perspect(-1.0,0,1.0) withcolor 0.3[white,opgreen];
draw perspect(1.0,1.0,0)--perspect(-1.0,1.0,0) withcolor 0.3[white,opgreen];
draw perspect(1.0,1.0,0)--perspect(1.0,-1.0,0) withcolor 0.3[white,opgreen];
draw perspect(1.0,0,1.0)--perspect(-1.0,0,1.0) withcolor 0.3[white,opgreen];
draw perspect(0,1.0,1.0)--perspect(0,-1.0,1.0) withcolor 0.3[white,opgreen];
draw perspect(0,1.0,-1.0)--perspect(0,1.0,1.0) withcolor 0.3[white,opgreen];
draw perspect(1.0,0,-1.0)--perspect(1.0,0,1.0) withcolor 0.3[white,opgreen];
drawarrow perspect(0,0,0)--perspect(-axis*1.2,0,0) withcolor opgreen;
drawarrow perspect(0,0,0)--perspect(0,-axis*1.2,0) withcolor opgreen;
drawarrow perspect(0,0,0)--perspect(axis*1.2,0,0) withcolor opgreen;
drawarrow perspect(0,0,0)--perspect(0,axis*1.2,0) withcolor opgreen;
drawarrow perspect(0,0,0)--perspect(0,0,-axis*1.2) withcolor opgreen;
drawarrow perspect(0,0,0)--perspect(0,0,axis*1.2) withcolor opgreen;
label.lrt(btex $\xi$ etex, perspect(1.2*axis,0,0));
label.llft(btex $\eta$ etex, perspect(0,1.2*axis,0));
label.lft(btex $\zeta$ etex, perspect(0,0,1.2*axis));

pickup pencircle scaled 0.13mm;
draw perspect(-1,-1,-1)--perspect(1,-1,-1)--
     perspect(1,1,-1)--perspect(-1,1,-1)--cycle;
draw perspect(-1,-1,-1)--perspect(-1,-1,1);

pickup pencircle scaled 0.25mm;
draw perspect(1,1,-1)--perspect(-1,1,-1)--
     perspect(-1,1,1)--perspect(1,1,1)--cycle;
draw perspect(1,1,-1)--perspect(1,-1,-1)--
     perspect(1,-1,1)--perspect(1,1,1)--cycle;
draw perspect(1,1,1)--perspect(-1,1,1)--
     perspect(-1,-1,1)--perspect(1,-1,1)--cycle;

% Label some of the vertices
pickup pencircle scaled 0;
fill fullcircle scaled 1mm shifted perspect(-1,-1,-1);
fill fullcircle scaled 1mm shifted perspect(-1, 1,-1);
fill fullcircle scaled 1mm shifted perspect( 1,-1,-1);
fill fullcircle scaled 1mm shifted perspect( 1, 1,-1);
fill fullcircle scaled 1mm shifted perspect( 0,-1,-1);
fill fullcircle scaled 1mm shifted perspect( 0, 1,-1);
fill fullcircle scaled 1mm shifted perspect( 1, 0,-1);
fill fullcircle scaled 1mm shifted perspect(-1, 0,-1);
fill fullcircle scaled 1mm shifted perspect( 0, 0,-1);
fill fullcircle scaled 1mm shifted perspect(-1,-1,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1,-1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 0,-1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 0, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 0,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 0,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1,-1, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1,-1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 0,-1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 0, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 0, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 0, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1,-1, 1);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 1,-1, 1);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 0,-1, 1);
fill fullcircle scaled 1mm shifted perspect( 0, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 1, 0, 1);
fill fullcircle scaled 1mm shifted perspect(-1, 0, 1);
fill fullcircle scaled 1mm shifted perspect( 0, 0, 1);
label.ulft(btex \textbf{ 1} etex, perspect(-1,-1,-1));
label.rt(btex   \textbf{ 2} etex, perspect(-1, 1,-1));
label.lft(btex  \textbf{ 3} etex, perspect( 1,-1,-1));
label.bot(btex  \textbf{ 4} etex, perspect( 1, 1,-1));
label.ulft(btex \textbf{17} etex, perspect( 0,-1,-1));
label.rt(btex   \textbf{18} etex, perspect( 0, 1,-1));
label.lft(btex  \textbf{19} etex, perspect( 1, 0,-1));
label.lft(btex  \textbf{20} etex, perspect(-1, 0,-1));
label.bot(btex  \textbf{33} etex, perspect( 0, 0,-1));
label.rt(btex   \textbf{ 5} etex, perspect(-1,-1,-1/3));
label.rt(btex   \textbf{ 6} etex, perspect(-1, 1,-1/3));
label.lft(btex  \textbf{ 7} etex, perspect( 1,-1,-1/3));
label.lft(btex  \textbf{ 8} etex, perspect( 1, 1,-1/3));
label.rt(btex   \textbf{21} etex, perspect( 0,-1,-1/3));
label.rt(btex   \textbf{22} etex, perspect( 0, 1,-1/3));
label.lft(btex  \textbf{23} etex, perspect( 1, 0,-1/3));
label.lft(btex  \textbf{24} etex, perspect(-1, 0,-1/3));
label.rt(btex   \textbf{ 9} etex, perspect(-1,-1, 1/3));
label.rt(btex   \textbf{10} etex, perspect(-1, 1, 1/3));
label.lft(btex  \textbf{11} etex, perspect( 1,-1, 1/3));
label.lft(btex  \textbf{12} etex, perspect( 1, 1, 1/3));
label.rt(btex   \textbf{25} etex, perspect( 0,-1, 1/3));
label.rt(btex   \textbf{26} etex, perspect( 0, 1, 1/3));
label.lft(btex  \textbf{27} etex, perspect( 1, 0, 1/3));
label.lft(btex  \textbf{28} etex, perspect(-1, 0, 1/3));
label.top(btex  \textbf{13} etex, perspect(-1,-1, 1));
label.rt(btex   \textbf{14} etex, perspect(-1, 1, 1));
label.lft(btex  \textbf{15} etex, perspect( 1,-1, 1));
label.llft(btex \textbf{16} etex, perspect( 1, 1, 1));
label.top(btex  \textbf{29} etex, perspect( 0,-1, 1));
label.rt(btex   \textbf{30} etex, perspect( 0, 1, 1));
label.lft(btex  \textbf{31} etex, perspect( 1, 0, 1));
label.llft(btex \textbf{32} etex, perspect(-1, 0, 1));
label.llft(btex \textbf{34} etex, perspect( 0, 0, 1));

verbatimtex
\end{document}
etex
