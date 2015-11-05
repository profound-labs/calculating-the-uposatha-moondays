% Memoir Article Class
%
% A memoir-based documentclass for org-mode exports.
%
% (c) Gambhiro Bhikkhu, 2014
% gambhiro.bhikkhu.85@gmail.com
%
% LPPL LaTeX Pubic Project Licence
%

% ==============
% Identification
% ==============

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{memoir-article}[2014/09/24 v0.1 A memoir-based documentclass for org-mode exports.]

% ========================
% Preliminary Declarations
% ========================

% =======
% Options
% =======

\RequirePackage{pgfopts}
\RequirePackage{calc}

\pgfkeys{
  /BOOK/.cd,
}

% Pass all unknown options to memoir
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\ProcessPgfOptions{/BOOK}
\ProcessOptions\relax

% ======================
% All Other Declarations
% ======================

\LoadClass{memoir}

\RequirePackage[british]{babel}

%\RequirePackage{amssymb}% Does any symbol need it?
\RequirePackage{amsmath}
\RequirePackage[bitstream-charter]{mathdesign}

\RequirePackage{fontspec}
\defaultfontfeatures{Ligatures={TeX}}
\setmainfont[
  ItalicFont = Crimson Italic,
  BoldFont = Crimson Bold,
  BoldItalicFont = Crimson BoldItalic,
  Numbers = Lining,
]{Crimson Roman}

\newfontfamily\logicFont[
  SmallCapsFont = Crimson Bold,
  SmallCapsFeatures= { Ligatures = TeX, Letters = SmallCaps, Scale = 0.8, LetterSpace = 0.2 },
]{Crimson Roman}

\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{enumitem}
\RequirePackage{multicol}

\graphicspath{{./includes/}}

\RequirePackage{hyperref}

\hypersetup{
  colorlinks=true,
  linkcolor=link,
  citecolor=link,
  filecolor=link,
  urlcolor=link,
  unicode=true,
}

\RequirePackage[
  open,
  openlevel=2
]{bookmark}

\RequirePackage{eso-pic}

\setlist[itemize]{
  itemindent=0pt,
  leftmargin=15pt,
  rightmargin=0pt,
  itemsep=3pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=0pt,
}

\hyphenation{under-lying astron-o-mer}

% === penalties ===

\midsloppy

% === normalsize ===

\definecolor{textbody}{gray}{0}
\definecolor{linkred}{HTML}{DC322F}
% Red is better for printing than blue or dark blue
\colorlet{link}{linkred}

\def\BOOK@apt{11}
\def\BOOK@bpt{14}

\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\BOOK@apt\BOOK@bpt
  \abovedisplayskip 11\p@ \@plus3\p@ \@minus6\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@
  \belowdisplayskip \abovedisplayskip
  \color{textbody}
  \let\@listi\@listI}
\normalsize

% === indentations ===

\setlength{\parskip}{5pt}
\setlength{\parindent}{0pt}

\setlength{\columnsep}{18pt}
\setlength{\columnseprule}{0pt}
%\setlength{\columnseprule}{0.1pt}
%\flushcolumns
\raggedcolumns

%\columnseprulecolor

% === setup page layout ===

\stockaiv
\settrimmedsize{\stockheight}{\stockwidth}{*}
\settrims{0pt}{0pt}
\setlrmarginsandblock{0.1\paperwidth}{*}{3}
\setulmarginsandblock{0.1\paperheight}{*}{1}
\setheadfoot{\baselineskip}{2\baselineskip}
\setheaderspaces{*}{15pt}{*}

\setmarginnotes{17pt}{45mm}{20pt}
%\addtolength{\marginparsep}{10pt}
%\addtolength{\marginparwidth}{-18mm}

\checkandfixthelayout

\setcounter{secnumdepth}{4}

%% abstract

\setlength{\absparindent}{0pt}
%\setlength{\absleftindent}{0.15\linewidth}
%\setlength{\absrightindent}{0.15\linewidth}
\setlength{\absleftindent}{2em}
\setlength{\absrightindent}{2em}

\newenvironment{tldr}{%
  \renewcommand\abstractname{TL,DR\marginpar{\footnotesize Too Long,\\ Didn't Read}}%
  \begin{abstract}%
}{%
  \end{abstract}%
}

%\setmarginfloatcaptionadjustment{figure}{\captionstyle{\mpjustification}}
\captionnamefont{\footnotesize}
\captiontitlefont{\footnotesize}

\newenvironment{fullwidth}{%
  \begin{minipage}{0.9\textwidth + \marginparsep + \marginparwidth}%
}{%
  \end{minipage}%
}

\newlength\marginDiff
\newcommand\includemap[1]{%
  {\centering
  \setlength\marginDiff{0.98\paperwidth - \linewidth}
  \hspace*{-0.5\marginDiff}
  \includegraphics[width=0.98\paperwidth]{#1}
  \par}
}

\newcommand\mA\textasteriskcentered

\newcommand\docVersion{v0.1}
\newcommand\docUrl{\href{http://github.com/profound-labs/}{download}}

\newif\ifshowdocinfo
\showdocinfotrue

\def\@maketitle{%
  \begin{minipage}{\linewidth}%
    \raggedright
    \LARGE\scshape\MakeTextLowercase{\thetitle}
    \vskip\onelineskip \hrule
    \ifshowdocinfo
      \vskip 5pt
      {\upshape\footnotesize \docVersion\ $\cdot$ \today\ $\cdot$ \docUrl}
    \fi
    \vskip\onelineskip
  \end{minipage}%
}

\renewcommand{\backmatter}{%
  \@mainmatterfalse
  \setcounter{secnumdepth}{-10}
  \ifartopt\else
    \@memback@floats
  \fi}

\hangsecnum

\gdef\clearforchapter{\par\bigskip}

\makechapterstyle{vinaya-class}{%
  \chapterstyle{default}
  \renewcommand*{\chaptitlefont}{\LARGE\scshape}
  \renewcommand*{\chapnumfont}{\chaptitlefont}
  \settowidth{\chapindent}{\normalsize 999}
  \renewcommand*{\chapterheadstart}{}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\chapternamenum}{}
  \renewcommand*{\printchapternum}{%
    \noindent\llap{\makebox[\chapindent][l]{\chapnumfont \MakeTextLowercase{\thechapter}}}}
  \renewcommand*{\afterchapternum}{}
  \renewcommand*{\printchaptertitle}[1]{%
    \memRTLraggedright\chaptitlefont\MakeTextLowercase{##1}}
  \renewcommand*{\afterchaptertitle}{}}

\makeheadstyles{vinaya-class}{%
  \chapterstyle{vinaya-class}

  % Sec 1.2

  \setbeforesecskip{1\onelineskip
                    \@plus -0.5\onelineskip \@minus -.5\onelineskip}%
  \setaftersecskip{1\onelineskip \@plus 0.1\onelineskip}%
%%%  \setsecheadstyle{\normalfont\raggedright\scshape\MakeLowercase}%
  \setsecheadstyle{\normalfont\memRTLraggedright\scshape}%

  % Sub Sec 1.2.3

  \setbeforesubsecskip{-1.0\onelineskip
                       \@plus -0.25\onelineskip \@minus -0.25\onelineskip}%
  \setaftersubsecskip{1.0\onelineskip \@plus 0.1\onelineskip}%
  \setsubsecheadstyle{\sethangfrom{\noindent ####1}\normalfont\itshape\memRTLraggedright}%

  % Sub Sub Sec 1.2.3.4

  \setbeforesubsubsecskip{-1.0\onelineskip
                       \@plus -0.25\onelineskip \@minus -0.25\onelineskip}%
  \setaftersubsubsecskip{1.0\onelineskip \@plus 0.1\onelineskip}%
  \setsubsubsecheadstyle{\sethangfrom{\noindent ####1}\normalfont\itshape\memRTLraggedright}%

  %\setbeforesubsubsecskip{1.0\onelineskip
  %                        \@plus 0.5\onelineskip \@minus 0.2\onelineskip}%
  %\setaftersubsubsecskip{-1em}%
  %\setsubsubsecheadstyle{\normalfont\normalsize\scshape\MakeTextLowercase}%

  % Para
  \setbeforeparaskip{1.0\onelineskip
                     \@plus 0.5\onelineskip \@minus 0.2\onelineskip}%
  \setafterparaskip{-1em}%
  \setparaheadstyle{\normalfont\normalsize\itshape\addperiod}%
  \setsubparaindent{\parindent}%
  \setbeforesubparaskip{1.0\onelineskip
                        \@plus 0.5\onelineskip \@minus 0.2\onelineskip}%
  \setaftersubparaskip{-1em}%
  \setsubparaheadstyle{\normalfont\normalsize\itshape\addperiod}}

%% Based on bringhurst from memoir.
\headstyles{vinaya-class}
\aliaspagestyle{chapter}{empty}

\makepagestyle{normalpage}
  \makeevenhead{normalpage}{\thepage}{}{}
  \makeoddhead{normalpage}{}{}{\thepage}

\pagestyle{normalpage}

\newcommand\fullpage[1]{%
\clearpage
\pagestyle{empty}
\mbox{}
\AddToShipoutPictureFG*{\put(0,0)%
{\begin{minipage}[b][\paperheight][t]{\paperwidth}%
#1
\end{minipage}%
}}%
}

\newfontfamily\thaiFont{Kinnari}

\newcommand*\thai[1]{{\thaiFont #1}}

\newcommand*\logic[1]{\textsc{\logicFont \MakeTextUppercase{#1}}}

\RequirePackage[final,babel=true]{microtype}
