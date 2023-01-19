%% presentation.cls
%% Copyright 2023 Tom M. Ragonneau
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3 or later is part of all distributions of LaTeX
% version 2005/12/01 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Tom M. Ragonneau.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{presentation}[2023/01/18 Presentation document class]

% Load beamer class
\PassOptionsToPackage{usenames,dvipsnames}{xcolor}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessOptions\relax
\LoadClass[10pt]{beamer}

% Manage frame numbering in appendices
\RequirePackage{appendixnumberbeamer}

% Beamer theme and color theme
\usetheme{Boadilla}
\usecolortheme{seahorse}
\usefonttheme{professionalfonts}

% Add the option 'nopagination' to the frame environment to remove the pagination from the footer
\usepackage{ifthen}
\newcommand{\insertfootline}[1][regular]{%
    \leavevmode%
    \hbox{%
        \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{author in head/foot}%
            \usebeamerfont{author in head/foot}\insertshortauthor\expandafter\ifblank\expandafter{\beamer@shortinstitute}{}{~~(\insertshortinstitute)}
        \end{beamercolorbox}%
        \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,center]{title in head/foot}%
            \usebeamerfont{title in head/foot}\insertshorttitle
        \end{beamercolorbox}%
        \begin{beamercolorbox}[wd=.333333\paperwidth,ht=2.25ex,dp=1ex,leftskip=2ex,rightskip=2ex,sep=0pt]{date in head/foot}%
            \hfill%
            \usebeamerfont{date in head/foot}%
            \insertshortdate{}%
            \hfill%
            \usebeamercolor[fg]{page number in head/foot}%
            \usebeamerfont{page number in head/foot}%
            \ifthenelse{\equal{#1}{regular}}{%
                \usebeamertemplate{page number in head/foot}%
            }{%
                \phantom{\usebeamertemplate{page number in head/foot}}%
            }%
        \end{beamercolorbox}%
    }%
    \vskip0pt%
}
\defbeamertemplate*{footline}{regular}{\insertfootline}
\defbeamertemplate{footline}{nopagination}{\insertfootline[nopagination]}
\providebool{nopaginationframe}
\define@key{beamerframe}{nopagination}[true]{
    \booltrue{nopaginationframe}
    \begingroup
    \setbeamertemplate{footline}[nopagination]
}
\apptocmd{\beamer@reseteecodes}{
    \ifbool{nopaginationframe}{
        \endgroup
        \boolfalse{nopaginationframe}
        \addtocounter{framenumber}{-1}
    }{}%
}{}{}

% Add the option 'nopagination' to the titlepage environment
\renewcommand{\maketitle}{
    \begin{frame}[nopagination]
        \titlepage
    \end{frame}
}

% Remove the navigation symbols
\setbeamertemplate{navigation symbols}{}

% Customize the itemize environment
\setbeamertemplate{itemize items}[triangle]

% Put only the numbered sections in the table of contents
\setbeamertemplate{section in toc}[sections numbered]

% Fonts
\usepackage[T1]{fontenc}
\usepackage[american]{babel}
\usepackage{fontspec}
\usepackage{csquotes}
\setsansfont{FiraSans}[
    Path=fonts/fira-sans/,
    Extension=.otf,
    UprightFont=*-Light,
    BoldFont=*-Medium,
    ItalicFont=*-LightItalic,
    BoldItalicFont=*-SemiBoldItalic,
]
\setmonofont{FiraMono}[
    Path=fonts/fira-mono/,
    Extension=.otf,
    UprightFont=*-Regular,
    BoldFont=*-Bold,
]

% Spacing between lines
\usepackage[nodisplayskipstretch]{setspace}
\setstretch{1.25}

% Alert text
\setbeamercolor{alerted text}{fg=RedViolet}
\setbeamerfont{alerted text}{series=\bfseries}

% Place a partial table of contents at the beginning of each section
\AtBeginSection[]{
	\begin{frame}[nopagination]
        \frametitle{Table of contents}
		\tableofcontents[currentsection,hideallsubsections]
	\end{frame}
}

% Bibliography
\RequirePackage[
    style=ext-authoryear-comp,
    articlein=false,
    sorting=nyt,
    sortcites=false,
    maxcitenames=3,
]{biblatex}
\DefineBibliographyStrings{american}{
    bathesis={B\adddot A\adddotspace thesis},
    mathesis={M\adddot A\adddotspace thesis},
    phdthesis={Ph\adddot D\adddotspace thesis},
}
\setbeamertemplate{bibliography item}[triangle]
\defbibenvironment{bibliography}{
	\list{}{
        \settowidth\labelwidth{\usebeamertemplate{bibliography item}}
        \setlength\leftmargin{\labelwidth}
        \setlength\labelsep{\biblabelsep}
        \addtolength\leftmargin{\labelsep}
        \setlength\bibitemsep{\itemsep}
        \setlength\parsep{\bibparsep}
	}
}{\endlist}{\item}
\DeclareNameAlias{author}{family-given}

% List of hyphenation exceptions for US English
% Source: https://ctan.org/tex-archive/info/digests/tugboat/hyphenex
\input{ushyphex}

% Email field
\newcommand{\email}[1]{\href{mailto:#1}{\texttt{\texorpdfstring{\usebeamercolor[fg]{structure}#1}{#1}}}}

% Patch warning `Package hyperref Warning: Token not allowed in a PDF string (Unicode)'
\pdfstringdefDisableCommands{\def\translate#1{#1}}

% Packages for mathematics
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{empheq}
\RequirePackage[bb=dsfontserif]{mathalfa}

% Mathematical constants, sets, and notations
\newcommand{\eu}{\mathrm{e}}
\newcommand{\iu}{\mathrm{i}}
\newcommand{\du}{\mathrm{d}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\T}{\mathsf{T}}

% Mathematical operators
\DeclareMathOperator*{\argmax}{arg\,max}
\DeclareMathOperator*{\argmin}{arg\,min}
\DeclareMathOperator{\card}{card}
\DeclareMathOperator{\conv}{conv}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator{\vspan}{span}

% Mathematical macros
\newcommand{\abs}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\lvert#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\rvert}
\newcommand{\ceil}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\lceil#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\rceil}
\newcommand{\floor}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\lfloor#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\rfloor}
\newcommand{\norm}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\lVert#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\rVert}
\newcommand{\set}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\{#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\}}
\newcommand{\inner}[2][]{\ifthenelse{\equal{#1}{auto}}{\left}{#1}\langle#2\ifthenelse{\equal{#1}{auto}}{\right}{#1}\rangle}

% Fine-tuning spacing in formulas
% Make @ behave as per catcode 13 (active). The TeXbook, p. 155.
\mathcode`@="8000{\catcode`\@=\active\gdef@{\mkern1mu}}
