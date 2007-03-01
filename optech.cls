%%% ====================================================================
%%% 	optech.cls - A TeX document class for OpenPave Technical docs
%%%   	(c) Openpave.org, 2006.
%%%
%%% $OpenPave$
%%% ====================================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{optech}
\LoadClassWithOptions{memoir}

\usepackage[T1]{fontenc}
%\usepackage{mathptmx}
%\usepackage{times}
%\usepackage{helvet}
%\renewcommand{\rmdefault}{ptm}
%\renewcommand{\sfdefault}{phv}
%\renewcommand{\ttdefault}{pcr}
%\renewcommand{\rmdefault}{times}
%\renewcommand{\sfdefault}{arial}
%\renewcommand{\ttdefault}{courier}

\clubpenalty=10000
\widowpenalty=10000 
\displaywidowpenalty=10000
%\hyphenpenalty=1000
%\tolerance=1000

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

\endinput
%%
%% End of file `report.cls'.
