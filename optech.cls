%
% optech.cls - A TeX document class for OpenPave Technical docs
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

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{optech}
\LoadClassWithOptions{memoir}

\usepackage[english]{babel}
\usepackage[latin1]{inputenc}
\usepackage[T1]{fontenc}
\RequirePackage{fixltx2e}
\RequirePackage{fix-cm}
\usepackage{latexsym}
\usepackage[full]{textcomp}

\usepackage{ifpdf}
\ifpdf
  \usepackage{microtype}
	\usepackage[pdftex]{graphics}
	\usepackage[pdftex]{graphicx}
	\DeclareGraphicsRule{*}{mps}{*}{}
	\LoadMetaPostSpecialExtensions
	\input glyphtounicode
	\pdfgentounicode=1
\else
	\usepackage[xetex]{graphics}
	\usepackage[xetex]{graphicx}
	\DeclareGraphicsRule{*}{eps}{*}{}
\fi

%\usepackage{stix}
\usepackage{lmodern}
%\usepackage{amsfonts,amssymb}

%\usepackage{pslatex}
%\usepackage{fourier}
%\usepackage{eulervm}
%\usepackage[utopia]{mathdesign}

\usepackage[fleqn,intlimits]{mathtools}
\mathtoolsset{showonlyrefs,showmanualtags}
\allowdisplaybreaks[3]

\usepackage{MnSymbol}
\usepackage[fullfamily,textlf,mathlf,minionint,loosequotes]{MinionPro}
\usepackage[toc,eqno,enum]{tabfigures}
\renewcommand{\sfdefault}{Myriad-LF}
\DeclareMathAlphabet\mathsf{T1}{Myriad-LF}{m}{n}
\SetMathAlphabet\mathsf{bold}       {T1}{Myriad-LF} {b}{n}
\SetMathAlphabet\mathsf{tabular}    {T1}{Myriad-TLF}{m}{n}
\SetMathAlphabet\mathsf{boldtabular}{T1}{Myriad-TLF}{b}{n}

\usepackage{color,calc}
\usepackage[perpage,symbol*,bottom]{footmisc}
\let\setspace@singlespace\m@m@singlespace
\usepackage{multirow}

\clubpenalty=10000
\widowpenalty=10000 
\displaywidowpenalty=10000
\hyphenpenalty=1000
\tolerance=1000

\renewcommand{\topfraction}{.85}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.15}
\renewcommand{\floatpagefraction}{.66}
\renewcommand{\dbltopfraction}{.66}
\renewcommand{\dblfloatpagefraction}{.66}
\setcounter{topnumber}{9}
\setcounter{bottomnumber}{9}
\setcounter{totalnumber}{20}
\setcounter{dbltopnumber}{9}

\definecolor{opgreen}{rgb}{.262745,.352941,.262745}

\makeatletter

\newsavebox{\opchapbox}
\newcommand\opchapbox@marker[1][40mm]{
 \sbox\opchapbox{
  \resizebox{!}{#1}{\fboxsep=0.2em\colorbox{opgreen}{\color{white}\thechapter}}
 }
 \rotatebox{90}{\resizebox{
   \heightof{\usebox{\opchapbox}}+\depthof{\usebox{\opchapbox}}
  }{!}{\scshape\@chapapp}
 }\quad
 \raisebox{\depthof{\usebox{\opchapbox}}}{\usebox{\opchapbox}}
}
\newcommand\opchapm{
 \sbox\opchapbox{\opchapbox@marker[6\baselineskip]}
 \makebox[\marginparwidth][r]{
  \raisebox{1.5\baselineskip-\heightof{\usebox{\opchapbox}}-\depthof{\usebox{\opchapbox}}}
 	 {\usebox{\opchapbox}}
 }
}

\makechapterstyle{optech}{
	\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft}
	\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{opgreen}}
	\renewcommand\chapternamenum{}
	\renewcommand\printchaptername{}
	\renewcommand\printchapternum{\marginpar{\opchapm}}
	\renewcommand\afterchapternum{}
	\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedright ##1\par}
	\setlength{\beforechapskip}{\baselineskip}
	\setlength{\midchapskip}{0pt}
	\setlength{\afterchapskip}{\baselineskip}
	\setsecheadstyle{\normalfont\large\scshape\bfseries\raggedright}
	\setsubsecheadstyle{\normalfont\normalsize\bfseries\raggedright}
	\setsubsubsecheadstyle{\normalfont\normalsize\itshape\raggedright}
}

\renewcommand{\makeheadrule}[3]{
  \@namedef{#1headrule}{
    \color{opgreen}\hrule\@width #2\@height #3 \vskip-#3}
}
\renewcommand{\makefootrule}[4]{
  \@namedef{#1footrule}{
    \vskip-#4\vskip-#3
    \color{opgreen}\hrule\@width #2\@height #3 \vskip #4}
}

\newcommand{\@opmarks}{
  \let\@mkboth\markboth
  \def\chaptermark##1{
    \markboth{##1}{}}
  \def\sectionmark##1{\markright{##1}}
  \def\tocmark{\markboth{\contentsname}{}}
  \def\lofmark{\markboth{\listfigurename}{}}
  \def\lotmark{\markboth{\listtablename}{}}
  \def\bibmark{\markboth{\bibname}{}}
  \def\indexmark{\markboth{\indexname}{}}
}
\makepagestyle{optech}
\makerunningwidth{optech}{\headwidth}
\makeheadposition{optech}{flushright}{flushleft}{flushright}{flushleft}
\makeevenfoot{optech}{\sffamily\small\thepage}{}{}
\makeoddfoot{optech}{}{}{\sffamily\small\thepage}
\makeheadrule{optech}{\headwidth}{1pt}
\makefootrule{optech}{\headwidth}{1pt}{0pt}
\makepsmarks{optech}{\@opmarks}
\makeevenhead{optech}{\sffamily\small\leftmark}{}{}
\makeoddhead{optech}{}{}{\sffamily\small\rightmark}

\copypagestyle{opchap}{optech}
\makeevenhead{opchap}{}{}{}
\makeoddhead{opchap}{}{}{}

\newcommand{\marginemp}[2]{
\marginpar{\centering\empuse{#1}\par \sffamily \bfseries \small #2}
}

\makeatother

\endinput
%%
%% End of file `report.cls'.
