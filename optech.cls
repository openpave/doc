%%% ====================================================================
%%% 	optech.cls - A TeX document class for OpenPave Technical docs
%%%   	(c) Openpave.org, 2006.
%%%
%%% $OpenPave$
%%% ====================================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{optech}
\LoadClassWithOptions{memoir}

\usepackage{latexsym}
\usepackage{textcomp}

\RequirePackage{fix-cm}
\usepackage[T1]{fontenc}
%\usepackage{lmodern} 
\usepackage{amsfonts,amssymb}
%\usepackage{pslatex}
%\usepackage{fourier}
%\usepackage{eulervm}
%\usepackage[utopia]{mathdesign}

\usepackage[fleqn,intlimits]{mathtools}
 
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

%% this makes images possible both in latex and pdftex
\usepackage{ifpdf}
\ifpdf
	\usepackage[pdftex]{graphics}
	\usepackage[pdftex]{graphicx}
	%\usepackage[bookmarks=false,%
	%pdftoolbar=true,%
	%pdfmenubar=true,%
	%pdffitwindow=true,%
	%colorlinks=true,pdftex]{hyperref}
	\DeclareGraphicsRule{*}{mps}{*}{}
\else
	\usepackage{graphics}
	\usepackage{graphicx}
	%\usepackage{hyperref}
\fi

\usepackage{color,calc}
\definecolor{opgreen}{rgb}{.262745,.352941,.262745}

\makeatletter

\newsavebox{\opchapbox}
\newcommand\opchapbox@marker[1][40mm]{%
\sbox\opchapbox{%
	\resizebox{!}{#1}{\fboxsep=0.2em%
		\colorbox{opgreen}{\color{white}\thechapter}%
}}%
\rotatebox{90}{%
 \resizebox{%
  \heightof{\usebox{\opchapbox}}+\depthof{\usebox{\opchapbox}}}%
   {!}{\scshape\@chapapp}}\quad%
 \raisebox{\depthof{\usebox{\opchapbox}}}{\usebox{\opchapbox}}%
}
\newcommand\opchapm[1][40mm]{%
 \centering
 \sbox\opchapbox{\opchapbox@marker[6\baselineskip]}%
 \makebox[0pt][c]{\usebox\opchapbox}%
}

\makechapterstyle{optech}{
	\renewcommand\chapnamefont{\normalfont\Large\scshape\raggedleft}
	\renewcommand\chaptitlefont{\normalfont\huge\bfseries\scshape\color{opgreen}}
	\renewcommand\chapternamenum{}
	\renewcommand\printchaptername{}
	\renewcommand\printchapternum{\par\marginpar{\opchapm}\par}
	\renewcommand\afterchapternum{}
	\renewcommand\printchaptertitle[1]{\chaptitlefont\raggedright ##1\par}
	\setlength{\beforechapskip}{\baselineskip}
	\setlength{\midchapskip}{0pt}
	\setlength{\afterchapskip}{\baselineskip}
	\setsecheadstyle{\normalfont\large\scshape\bfseries\raggedright}
	\setsubsecheadstyle{\normalfont\normalsize\bfseries\raggedright}
	\setsubsubsecheadstyle{\normalfont\normalsize\itshape\raggedright}
}

\renewcommand{\makeheadrule}[3]{%
  \@namedef{#1headrule}{%
    \color{opgreen}\hrule\@width #2\@height #3 \vskip-#3}
}
\renewcommand{\makefootrule}[4]{%
  \@namedef{#1footrule}{%
    \vskip-#4\vskip-#3
    \color{opgreen}\hrule\@width #2\@height #3 \vskip #4}
}

\newcommand{\@opmarks}{%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
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

\makeatother

\endinput
%%
%% End of file `report.cls'.
