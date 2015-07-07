%
% block16.mp - Sixteen node FEM element
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

pickup pencircle scaled 0.13mm;
draw perspect(-1,-1,-1)--perspect(1,-1,-1)--
     perspect(1,1,-1)--perspect(-1,1,-1)--cycle;
draw perspect(-1, 0,-1)--perspect( 1, 0,-1);
draw perspect( 0, 0,-1)--perspect( 0,-1,-1);
draw perspect(-1,-1,-1)--perspect(-1,-1, 1);
draw perspect(-1, 0,-1)--perspect(-1, 0, 1);
draw perspect( 0,-1,-1)--perspect( 0,-1, 1);
draw perspect( 0, 0,-1)--perspect( 0, 0, 1);

pickup pencircle scaled 0.25mm;
draw perspect(1,1,-1)--perspect(-1,1,-1)--
     perspect(-1,1,1)--perspect(1,1,1)--cycle;
draw perspect(1,1,-1)--perspect(1, 0,-1)--
     perspect(1,0, 1)--perspect(1, 1, 1)--cycle;
draw perspect(1,1,1)--perspect(-1,1,1)--
     perspect(-1,0,1)--perspect(1,0,1)--cycle;

draw perspect(1,-1,-1)--perspect(1,0,-1)--
     perspect(1,0,1)--perspect(1,-1,1)--cycle;
draw perspect(1,-1,1)--perspect(0,-1,1)--
     perspect(0,0,1)--perspect(1,0,1)--cycle;

draw perspect(-1,-1,1)--perspect(0,-1,1)--
     perspect(0,0,1)--perspect(-1,0,1)--cycle;

% Label some of the vertices
pickup pencircle scaled 0;
fill fullcircle scaled 1mm shifted perspect(-1, 0,-1);
fill fullcircle scaled 1mm shifted perspect(-1, 1,-1);
fill fullcircle scaled 1mm shifted perspect( 1, 0,-1);
fill fullcircle scaled 1mm shifted perspect( 1, 1,-1);
fill fullcircle scaled 1mm shifted perspect(-1, 0,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 0,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 0, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 0, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 0, 1);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 1, 0, 1);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 0, 0,-1);
fill fullcircle scaled 1mm shifted perspect( 0, 0,-1/3);
fill fullcircle scaled 1mm shifted perspect( 0, 0, 1/3);
fill fullcircle scaled 1mm shifted perspect( 0, 0, 1);

verbatimtex
\end{document}
etex
