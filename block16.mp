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
fill fullcircle scaled 0.75mm shifted perspect(-1,0,0) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,-1,0) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,1,0) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(1,0,0) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,0,-1) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,0,-1/3) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,0,1/3) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,0,1) withcolor opgreen;
fill fullcircle scaled 0.75mm shifted perspect(0,0,0) withcolor opgreen;
label.lrt("$-1$", perspect(-1,0,0));
label.llft("$-1$", perspect(0,-1,0));
label.rt("$-1$", perspect(0,0,-1));
label.lrt("$-\frac{1}{3}$", perspect(0,0,-1/3));
label.lrt("$1$", perspect(1,0,0));
label.llft("$1$", perspect(0,1,0));
label.lft("$1$", perspect(0,0,1));
label.lft("$\frac{1}{3}$", perspect(0,0,1/3));
label.lrt("$\xi$", perspect(1.2*axis,0,0));
label.llft("$\eta$", perspect(0,1.2*axis,0));
label.lft("$\zeta$", perspect(0,0,1.2*axis));
label.llft("O", perspect(0,0,0));

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
fill fullcircle scaled 1mm shifted perspect(-1,-1,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1,-1,-1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1,-1/3);
fill fullcircle scaled 1mm shifted perspect(-1,-1, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1,-1, 1/3);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1/3);
fill fullcircle scaled 1mm shifted perspect(-1,-1, 1);
fill fullcircle scaled 1mm shifted perspect(-1, 1, 1);
fill fullcircle scaled 1mm shifted perspect( 1,-1, 1);
fill fullcircle scaled 1mm shifted perspect( 1, 1, 1);
label.ulft("\textbf{ 1}", perspect(-1,-1,-1));
label.rt(  "\textbf{ 2}", perspect(-1, 1,-1));
label.lft( "\textbf{ 3}", perspect( 1,-1,-1));
label.bot( "\textbf{ 4}", perspect( 1, 1,-1));
label.rt(  "\textbf{ 5}", perspect(-1,-1,-1/3));
label.rt(  "\textbf{ 6}", perspect(-1, 1,-1/3));
label.lft( "\textbf{ 7}", perspect( 1,-1,-1/3));
label.lft( "\textbf{ 8}", perspect( 1, 1,-1/3));
label.rt(  "\textbf{ 9}", perspect(-1,-1, 1/3));
label.rt(  "\textbf{10}", perspect(-1, 1, 1/3));
label.lft( "\textbf{11}", perspect( 1,-1, 1/3));
label.lft( "\textbf{12}", perspect( 1, 1, 1/3));
label.top( "\textbf{13}", perspect(-1,-1, 1));
label.rt(  "\textbf{14}", perspect(-1, 1, 1));
label.lft( "\textbf{15}", perspect( 1,-1, 1));
label.llft("\textbf{16}", perspect( 1, 1, 1));
