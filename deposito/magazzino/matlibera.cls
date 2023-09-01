%%
%% This is file `matlibera.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% matlibera.dtx  (with options: `class')
%% 
%% Copyright (C) 2013-2022 by Daniele Zambelli - daniele.zambelli@gmail.com
%% 
\NeedsTeXFormat{LaTeX2e}[[2018/01/01]
\ProvidesClass{matlibera}[%
    2023/06/13 v0.9.60
    Classe per il libro di Matematica Libera]

\LoadClassWithOptions{memoir}[2011/03/06]

\setstocksize{277mm}{200mm}
\settrimmedsize{277mm}{200mm}{*}
\settrims{0mm}{0mm}
\settypeblocksize{598pt}{341pt}{*}     % 210.17296mm x 119.84779mm
\setlrmargins{30mm}{*}{*}              % default spine: 35.9mm
\setulmargins{34.1mm}{*}{*}            % default upper: 44.1mm
\setmarginnotes{2.5mm}{37.5mm}{5mm}
\checkandfixthelayout

\setsecnumdepth{subsection}

\RequirePackage{amsmath, amssymb, amsthm}% amsfonts è caricato da amssymb
\RequirePackage[e]{esvect} % per i vettori
\RequirePackage{cancel} % per le semplificazioni
\RequirePackage[normalem]{ulem} % sottolineature
\RequirePackage[np,noaddmissingzero,autolanguage]{numprint}
\RequirePackage{mathtools} % da approfondire

\RequirePackage[greek, italian]{babel}
\usepackage{iftex}

\ifpdftex\typeout{************* PDFTeX*****************}
  \RequirePackage[T1]{fontenc}
  \RequirePackage[utf8]{inputenc}% non più necessario, ma non disturba
  \RequirePackage{stix2} % font

\else
  \ifluatex\typeout{************* LuaLaTeX *****************}
    \usepackage{fontspec}
    \setmainfont{STIX}[Ligatures=TeX]
    \usepackage[math-style=ISO]{unicode-math}
    \setmathfont{STIX Two Math}
  \fi
\fi


  % Per ora non viene caricato il pacchetto |axessibility|
  % perché è incompatibile con la libreria |minted|.
  % \ifpdftex\typeout{************* axessibility *****************}
  %   \usepackage[accsupp]{axessibility} % per la lettura delle formule
  % \fi

\RequirePackage{eurosym} % simbolo dell'euro
\RequirePackage{pifont} % simboli unicode
\RequirePackage[inline]{enumitem} % elenchi
\RequirePackage{multicol} % testo su più colonne
\RequirePackage{multirow} % tabelle con celle su più righe
\RequirePackage{quoting} % per le citazioni
\quotingsetup{font=small}
\RequirePackage{tabto} % per punti di tabulazione
\RequirePackage{microtype} % per la composizione fine
\RequirePackage[usenames, dvipsnames]{xcolor}   % gestione colori
\RequirePackage{pgfplots} % per axis
\RequirePackage{tikz}
\RequirePackage{tkz-fct} % per il disegno di funzioni
\RequirePackage{tikz-qtree} % per alberi
\usetikzlibrary{
  arrows,%
  arrows.meta,
  through,
  automata,%
  backgrounds,%
  calc,%
  circuits.ee.IEC,
  decorations.markings,%
  decorations.shapes,%
  decorations.text,%
  decorations.pathreplacing,%
  fit,%
  matrix,%
  mindmap,%
  patterns,%
  positioning,%
  intersections,%
  shapes,%
  shapes.geometric,
}
\RequirePackage{tkz-euclide} % in geometria viene usato \tkzDrawSegment

\RequirePackage[most]{tcolorbox}% per i box colorati
\RequirePackage{piton}% per i listati dei programmi
\PitonOptions{all-line-numbers, auto-gobble, background-color = green!15,
              splittable=3, break-lines-in-Piton, indent-broken-lines,
              }
\RequirePackage[colorlinks, hyperindex, pagebackref,
                linkcolor=RoyalBlue, filecolor=RoyalBlue,
                citecolor = black, urlcolor=RoyalBlue]{hyperref}
\RequirePackage{imakeidx}   % Indice analitico
\makeindex[options={-s matlibera.ist}, title=Indice analitico, intoc,
           columns=2]

\newcommand{\colormd}{Mahogany}
\newcommand{\colortcblist}{BlueGreen}
\newcommand{\coloross}{violet}
\newcommand{\coloresem}{yellow}
\newcommand{\colorproc}{teal}
\newcommand{\colordef}{blue}
\newcommand{\colortheo}{green}
\newcommand{\colorproof}{orange}
\newcommand{\colortit}{green}

\newcommand{\numnameref}[1]{\ref{#1} \nameref{#1}}

\providecommand{\folder}{./}

\newcommand{\parte}[2]{% Un gruppo di capitoli.
  % Sintassi: \parte{directory}{nome parte}
  % Esempio: \parte{\matdir 0_a_parti/}{part_01_1_d}
  \renewcommand{\folder}{#1}
  \graphicspath{{\folder}}
  \include{\folder #2}
}

\newcommand{\capitolo}[2]{% Un capitolo.
  % Sintassi: \capitolo{directory}{nome capitolo}
  % Esempio: \capitolo{\matdir 04_Equazioni/01_Eq_grado_1/eq01/}
  %                   {equazioni}
  \renewcommand{\folder}{#1}
  \graphicspath{{\folder}}
  \input{\folder #2}
  \newpage
  \input{\folder #2_ese}
  \cleardoublepage
}

\newtcolorbox{inibox}[1]{colback=\colormd!5,
colframe=\colormd!75,fonttitle=\bfseries,
colbacktitle=\colormd!75,enhanced,
attach boxed title to top center={yshift=-1mm},
title={#1}}

\newcommand{\inicapitolo}[1]{
\begin{inibox}{In questo capitolo incontrerai:}
#1
\end{inibox}
}

\newcommand{\spazielenx}{%
  \setlength{\itemsep}{0pt}%
  \setlength{\parskip}{5pt}%
}

\renewcommand{\labelitemi}{\textcolor{Salmon}{\ding{225}}}

\renewcommand{\labelitemii}{%
  \textcolor{Salmon}{\ding{224}}%
}

\renewcommand{\labelitemiii}{%
  \textcolor{Salmon}{\ding{223}}%
}

\newenvironment{enumeratea}{%
  \begin{enumerate}[left=0mm, label=\alph*\,), nosep]%
  \spazielenx
}{%
  \end{enumerate}%
}

\newenvironment{enumeratees}{%
  \begin{enumerate}
    [leftmargin=0cm, itemindent=.5cm, nosep, label=\alph*)]
}{%
  \end{enumerate}%
}

\newtheorem{esercizio}{\color{Sepia}}[chapter]

\DeclareTCBListing{latexlistingbox}{ s O{} m }{%
breakable,
colback = \colortcblist!5!white,
colframe = \colortcblist!75!black,
fonttitle = \bfseries,
IfBooleanTF = {#1}{}{listing side text},
title={#3},#2}

\theoremstyle{plain}
\tcbset{
ossstyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
arc=0mm, colback=\coloross!5!white, colframe=\coloross!50!black,
theorem style=plain, coltitle=\coloross!30!black},
procstyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
arc=0mm, colback=\colorproc!5!white, colframe=\colorproc!50!black,
theorem style=plain, coltitle=\colortit!30!black},
defstyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
colback=\colordef!5!white, colframe=\colordef!50!black,
theorem style=plain, coltitle=\colortit!30!black},
poststyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
colback=\colortheo!10!white, colframe=\colortheo!75!black,
theorem style=plain, coltitle=\colortit!30!black},
theostyle/.style={fonttitle=\bfseries\upshape, fontupper=\slshape,
colback=\colortheo!5!white, colframe=\colortheo!50!black,
theorem style=plain, coltitle=\colortit!30!black},
esemstyle/.style={
fonttitle=\bfseries\upshape, fontupper=\slshape,
enhanced jigsaw, breakable,
arc=0mm, colback=\coloresem!5!white, colframe=\coloresem!50!black,
theorem style=plain, coltitle=\coloresem!30!black}
}

\tcolorboxenvironment{proof}{% `proof' from `amsthm'
blanker, breakable, left=5mm, oversize,
before skip=10pt, after skip=10pt,
borderline west={1mm}{0pt}{\colorproof!60!black!20!white}}

\newenvironment{dimostrazione}{%
  \begin{proof}[Dimostrazione]%
}{%
  \end{proof}%
}

\newenvironment{soluzione}{%
  \begin{proof}[Soluzione]%
}{%
  \end{proof}%
}

\newtcbtheorem[number within=chapter]{osservazione}{Osservazione}
              {ossstyle}{oss}

\newtcbtheorem[use counter from=osservazione]{osservazioni}{Osservazioni}
              {ossstyle}{oss}

\newtcbtheorem[number within=chapter]{esempio}{Esempio}
              {esemstyle}{esem}

\newtcbtheorem[use counter from=esempio]{esempi}{Esempi}
              {esemstyle}{esem}

\newtcbtheorem[use counter from=esempio]{problema}{Problema}
              {esemstyle}{prob}

\newtcbtheorem[number within=chapter]{procedura}{Procedura}
              {procstyle}{proc}

\newtcbtheorem[number within=chapter]{definizione}{Definizione}
              {defstyle}{def}

\newtcbtheorem[number within=chapter]{postulato}{Postulato}
              {poststyle}{post}

\newtcbtheorem[number within=chapter]{teorema}{Teorema}
              {theostyle}{th}

\newtcbtheorem[use counter from=teorema]{lemma}{Lemma}
              {theostyle}{th}

\newtcbtheorem[use counter from=teorema]{corollario}{Corollario}
              {theostyle}{th}

\makeatletter
\AtEndPreamble{\ifcsstring{languagename}{english}{\relax}{%
  \mathcode`\,=\string"8000}%
   \DeclareMathSymbol{\virgola}{\mathpunct}{letters}{"3B}%
   \DeclareMathSymbol{\virgoladecimale}{\mathord}{letters}{"3B}%
}
{\catcode `,=\active \gdef,{\futurelet\let@token\m@thcomma}}%
\AtEndPreamble{%
  \unless\ifcsname m@thcomma\endcsname\providecommand\m@thcomma{}\fi
    \renewcommand\m@thcomma[1]{%
    \let\tempB#1\relax
    \ifx\tempB\bar
      \virgoladecimale
    \else
      \ifx\tempB\overline
        \virgoladecimale
      \else
        \unless\ifcat\noexpand\let@token*%
          \virgola
        \else
          \edef\tempA{\expandafter\@gobble\string#1}%
          \ifx\tempA\@empty
            \virgoladecimale
          \else
            \virgola
          \fi
        \fi
      \fi
    \fi#1%
  }
}

\AtEndPreamble{
  \providecommand\IntelligentComma{}
  \providecommand\NoIntelligentComma{}
  \renewcommand\IntelligentComma{\mathcode`\,=\string"8000}
  \renewcommand\NoIntelligentComma{\mathcode`\,=\string"613B}
}

\renewcommand{\printpartname}{}
\renewcommand{\partnamenum}{}
\renewcommand{\printpartnum}{}
\renewcommand{\partnumfont}{%
  \fontseries{b} \fontsize{.9in}{0in} \selectfont \color{\colormd}
}
\renewcommand{\parttitlefont}{
  \Huge\bfseries\sffamily\raggedleft%
}
\renewcommand{\beforepartskip}{\vspace*{0.1in}}
\renewcommand{\midpartskip}{}
\renewcommand{\afterpartskip}{\vspace{1in}}
\renewcommand{\@setuppart}{\beforepartskip}
\renewcommand{\@endpart}{\afterpartskip}
\renewcommand{\printparttitle}[1]{%
  \thispagestyle{empty}%
    \noindent
    \begin{tabularx}{\textwidth}{Xr}
     {\parbox[b]{\linewidth}{\parttitlefont #1}}%
      & \raisebox{-15pt}{\partnumfont \thepart} \\%
    \end{tabularx}
}

\newif\ifchapternonum
\makechapterstyle{matliberachap}{%
  \renewcommand\printchaptername{}
  \renewcommand\printchapternum{}
  \renewcommand{\beforechapskip}{-25pt}
  \renewcommand\printchapternonum{\chapternonumtrue}
  \renewcommand\chaptitlefont{%
    \huge\sffamily\bfseries\raggedleft%
  }
  \renewcommand\chapnumfont{%
    \fontseries{b} \fontsize{.9in}{0in} \selectfont \color{\colormd}
  }
  \renewcommand\printchaptertitle[1]{%
    \noindent%
    \ifchapternonum%
      \begin{tabularx}{\textwidth}{X}%
        {\parbox[b]{\linewidth}{\chaptitlefont ##1}%
        \vphantom{\raisebox{15pt}{\chapnumfont 1}}}
      \end{tabularx}%
    \else
      \begin{tabularx}{\textwidth}{Xl}
        {\parbox[b]{\linewidth}{\chaptitlefont ##1}}%
        & \raisebox{-15pt}{ \chapnumfont  \thechapter}%
      \end{tabularx}%
    \fi
    \par\vskip2mm%\hrule
  }
}
\chapterstyle{matliberachap}

\setsecheadstyle{%
  \Large\sffamily\bfseries\raggedright%
}

\setsubsecheadstyle{%
  \sffamily\bfseries\raggedright%
}

\setsubsubsecheadstyle{%
  \sffamily\bfseries\raggedright%
}

\makepagestyle{matliberapage}
\makeevenhead{matliberapage}
  {\oldstylenums{\thepage} \qquad \slshape\leftmark}{}{}
\makeoddhead{matliberapage}
  {}{}{\slshape\rightmark \qquad \oldstylenums{\thepage}}
\makeheadrule{matliberapage}{\textwidth}{\normalrulethickness}
\makeheadfootruleprefix{matliberapage}{\color{\colormd}}{}
\nouppercaseheads
\newcommand{\headcap}{%
  {\color{\colormd} \thechapter. }%
}
\newcommand{\headsec}{%
  {\color{\colormd} \thesection. }%
}
\makepsmarks{matliberapage}{%
  \def\chaptermark##1{\markboth{%
        \ifnum \value{secnumdepth} > -1
          \if@mainmatter
           \headcap   %
          \fi
        \fi
        ##1}{}%
  }
  \def\sectionmark##1{\markright{%
        \ifnum \value{secnumdepth} > 0
          \headsec ~%
        \fi
        ##1}%
  }
\makeatother

\createplainmark{toc}{both}{\contentsname}
\createplainmark{lof}{both}{\listfigurename}
\createplainmark{lot}{both}{\listtablename}
\createplainmark{bib}{both}{\bibname}
\createplainmark{index}{both}{\indexname}
\createplainmark{glossary}{both}{\glossaryname}
}

\pagestyle{matliberapage}

\newcommand{\longarrayREMOVE}{\renewcommand{\arraystretch}{2}}

\newcommand{\osservazionea}{%
  \paragraph{%
    {\color{\colormd}\ding{113}} Osservazione%
  }%
}

\newcommand{\conclusione}{%
  \paragraph{%
    {\color{\colormd}\ding{109}} Conclusione%
  }%
}

\newcommand{\vspazioREMOVE}{\vspace{1ex}}

\newcommand{\risolviREMOVE}{%
  {\fontsize{12pt}{0pt}%
    \Writinghand\,} \emph{Esercizio proposto: %
  }%
}

\newcommand{\risolviiREMOVE}{%
  {\fontsize{12pt}{0pt}%
    \Writinghand\,} \emph{Esercizi proposti: %
  }%
}

\providecommand{\superscriptREMOVE}[1]{^{#1}}

\newcommand{\Ast}{{}^{\ast}}

\newcommand{\croceREMOVE}{\superscript{\dag}}

\newcommand{\aC}{a.C.} %{a.e.v.}

\newcommand{\dC}{d.C.} %{p.e.v.}

\newcommand{\aev}{a.C.} %{a.e.v.}

\newcommand{\pev}{d.C.} %{p.e.v.}

\newcommand{\tggg}[0]{\textgreater\textgreater\textgreater}

\newcommand{\fcharboxREMOVE}[1]{\fbox{#1}} % Usare direttamente |fbox{...}|.

\newcommand{\emptybox}{\fbox{\phantom{N}}}

\newcommand{\verofalso}{\fbox{V}~\fbox{F}}

\newcommand{\sino}{\fbox{~Sì~}\hspace{2ex}\fbox{No}}

\newif\ifsolall

\newcommand{\sol}[1]{
\phantom{.}\hfill \footnotesize\(\quadra{#1}\)\normalsize
}

\newcommand{\solt}[1]{\phantom{.}\hfill [\footnotesize #1\normalsize]}

\newcommand{\solop}[1]{
  \ifsolall{\phantom{.}\hfill \footnotesize\(\quadra{#1}\)\normalsize}
  \else{\phantom{.}\hfill \footnotesize\(\quadra{\phantom{#1}}\)\normalsize}
  \fi
}

\newcommand{\solno}[1]{
\phantom{.}\hfill \footnotesize\(\phantom{#1}\)\normalsize
}

\newcommand{\solfun}[3]{
  % Sintassi: \solfun{ID}{f', pendenze}{f'', concavità}
  % Esempio di chiamata:
  % \solfun{++\compreso{-2}--\compreso{-1}++\compreso{1}--\compreso{2}++}
  % {2x(2x^2-5):\quad\searrow \escluso{-\sqrt{\frac{5}{2}}} \nearrow
  %  \escluso{0}\searrow \escluso{\sqrt{\frac{5}{2}}} \nearrow}
  % {2(6x^2-5):\quad\smile \escluso{-\sqrt{\frac{5}{6}}} \frown
  %  \escluso{\sqrt{\frac{5}{6}}} \smile}
  \footnotesize
  \phantom{.}\hfill \(\bigg[#1\bigg.\); \\
  \phantom{.}\hfill \(f'(x)=#2\); \\
  \phantom{.}\hfill \(\bigg.f''(x)=#3\bigg]\)
  \normalsize
}

\newcommand{\sframe}[1]{\fbox{\footnotesize\(#1\)\normalsize}}

\newcommand{\sframeop}[1]{
  \ifsolall{\fbox{\parbox[c][1.7ex][b]{1ex}
                         {\footnotesize\(#1\)\normalsize}}}
  \else{\fbox{\parbox[c][1ex][b]{1.5ex}
                     {\phantom{\footnotesize\(#1\)\normalsize}}}}
  \fi
}

\newcommand{\sframeno}[1]{
  \fbox{\phantom{\footnotesize\(#1\)\normalsize}}}

\newcommand{\srb}[2][-.5]{
  \raisebox{#1em}{\(#2\)}
}

\newcommand{\srbop}[2][-.5]{
  \ifsolall{\raisebox{#1em}{\(#2\)}}
  \else{\raisebox{#1em}{\phantom{\(#2\)}}}
  \fi
}

\newcommand{\srbno}[2][-.5]{
  \raisebox{#1em}{\phantom{\(#2\)}}
}

\newcommand{\intestazioneREMOVE}[2]{
  \renewcommand{\folder}{#1}
  \graphicspath{{\folder}}
  \include{\folder #2}
  \cleardoublepage  % TODO non deve esserci tra intestazione e colophon!!!
}

\newcommand{\myp}{~\\ [-1.3em]} % Riposiziona l'etichetta di un elenco.

\newenvironment{htmulticols}[1]%
{\begin{multicols}{#1}}
{\end{multicols}}

\newcommand{\affiancati}[4]{
  % Sintassi: \affiancati{larg1}{Larg2}{testo1}{testo2}
  % Esempio di chiamata:
  % \affiancati{.48}{.48}{testo 1}{testo 2}
  \noindent\begin{minipage}{#1\textwidth}
    #3
  \end{minipage}
  \hfill
  \begin{minipage}{#2\textwidth}
    #4
  \end{minipage}
}

\newcommand{\affiancatic}[4]{
  % Sintassi: \affiancati{larg1}{Larg2}{testo1}{testo2}
  % Esempio di chiamata:
  % \affiancati{.48}{.48}{testo 1}{testo 2}
  \noindent \begin{minipage}{#1\textwidth}
    \begin{center} #3 \end{center}
  \end{minipage}
  \hfill
  \begin{minipage}{#2\textwidth}
    \begin{center} #4 \end{center}
  \end{minipage}
}

\newcommand{\triaffiancati}[6]{
  % Sintassi: \triaffiancati{larg1}{larg2}{larg2}{testo1}{testo2}{testo3}
  % Esempio di chiamata:
  % \triaffiancati{.48}{.24}{.24}{testo 1}{testo 2}{testo 3}
  \noindent\begin{minipage}[b]{#1\textwidth}
  #4
  \end{minipage}
  \hfill
  \begin{minipage}[b]{#2\textwidth}
  #5
  \end{minipage}
  \hfill
  \begin{minipage}[b]{#3\textwidth}
  #6
  \end{minipage}
}

\newcommand{\segnoretta}[3]{% Segno di una retta
  % Sintassi: \segnoretta{Equazione ass.}{funzione ass.}{grafico}
  % Esempio di chiamata:
  % \segnoretta{x - 4 = 0 \quad \Rightarrow \quad x = 4}
  %            {y = x - 4 \quad \rightarrow}
  %            {\segnicre{4}}
 \begin{minipage}{.45\textwidth}
  E.A.:~\(#1\)
 \end{minipage}
 \begin{minipage}{.25\textwidth}
  F.A.:~\(#2\)
 \end{minipage}
 \begin{minipage}{.3\textwidth}
  #3
 \end{minipage}
}

\newcommand{\insiemesoluzione}[3]{% Insieme soluzione di una disequazione
  % Sintassi: \insiemesoluzione{s. grafica}{s. predicati}{s. parentesi}
  % Esempio di chiamata:
  %  \insiemesoluzione{\inteaa{4}{-1.5}{+1.5}{-2}{+1}}
  %    {\(x<-2 \sor x>+1\)}
  %    {\(\intervaa{-\infty}{-2}~\cup~\intervaa{1}{-\infty}\)}
\noindent\begin{minipage}[t]{.29\textwidth}
 \begin{center}
  Forma grafica\\ %[-.5em]
     #1
  \vspace{.4em}
 \end{center}
  \end{minipage}
  \begin{minipage}[t]{.30\textwidth}
  \begin{center}
  Esp. con i predicati\\ [.9em]
  #2
 \end{center}
  \end{minipage}
  \begin{minipage}[t]{.30\textwidth}
 \begin{center}
  Esp. con le parentesi\\ [.9em]
  #3
 \end{center}
  \end{minipage}
}

\newcommand{\elenconumerato}[2]{% Elenco numeato
  % Sintassi: \elenconumerato{items}{spazio verticale}
  % Esempio di chiamata:
  % \elenconumerato{{$3+2$, $4 \cdot 5$, {con, VIRGOLE, $5^3$}}
  %                {\vspace{1cm}}}
\begin{enumerate}
 \foreach \x in #1 {\item \x #2}
\end{enumerate}
}

\newenvironment{inaccessibleblock}[1][]{}{}

\newenvironment{alternativetext}[1]{}{}

\NewDocumentCommand \immagine{s O{1} m m}{
  % Macro for placing image with:
  % - Alternative text,
  % - scale (default value: 1),
  % - centered without an asterisk, with asterisk does NOT center the image.
  % Examples:
  %% \immagine{}{}
  %% \immagine{Alternative text}{\miaimmagine}
  %% \immagine[.5]{Alternative text}{\miaimmagine}
  %% \immagine*[.5]{Alternative text}{\miaimmagine}
  %
  \begin{alternativetext}{#3}
  \IfBooleanF{#1}
    {\begin{center}}
  \scalebox{#2}{#4}
  \IfBooleanF{#1}
    {\end{center}}
  \end{alternativetext}
}

\newcommand{\central}[1]{% Centra un testo in una riga.
  \phantom{.}\hfill #1 \hfill ~
}

\newcommand{\centrat}[1]{\begin{center}#1\end{center}}

\newcommand{\video}[2]{
\marginpar{
\includegraphics[scale=.25]{\folder link/#1}

\href{https://#2}{#2}}
}


\newcounter{linkedlemma}
\setcounter{linkedlemma}{100}

\makeatletter

\providecommand*\seelink[2]{#1}%

\NewDocumentCommand\linkindex{s m}%
  {\IfBooleanTF{#1}
    {\relax}{%
      \stepcounter{linkedlemma}%
      \edef\linked@label{idx:\the\c@linkedlemma}%
      \edef\linkedlabel{\linked@label}\phantomsection% <-- AGGIUNTO!
      \label{\linkedlabel}\index{#2|seelink{\pageref{\linkedlabel}}%
            }%
    }%
  }%

\makeatother

\newcommand{\ind}[1]{% Inserisce l'argomento nell'indice.
  \linkindex{#1}}

\newcommand{\indt}[1]{% Come \ind ma lo scrive anche nel testo.
  \ind{#1}#1}

\newcommand{\indc}[2]{% Come \ind ma lo categorizza.
  \ind{#2}\linkindex{#1!#2@\textit{\slshape#2}}}

\newcommand{\indtc}[2]{% Come \indt ma lo categorizza.
  \indc{#1}{#2}#2}

\makeatletter
\let\original@printindex\printindex
\RenewDocumentCommand\printindex{o D(){\small}}{
  \bgroup
  #2\IfValueTF{#1}{\original@printindex[#1]}{\original@printindex}
  \egroup}
\makeatother

%% 
%%  This file may be distributed and/or modified under the
%%  conditions of the LaTeX Project Public Licence, either
%%  version 1.3c of this licence or (at your option) any later
%%  version. The latest version of this licence is in:
%% 
%%   http://www.latex-project.org/lppl.txt
%% 
%%  and version 1.3c  or later is part of all distributions of
%%  LaTeX version 2008/05/04 or later.
%% 
%%  This work has the LPPL maintenance status `maintained'.
%%  and consists of the files listed in the README file.
%% 
%%
%% End of file `matlibera.cls'.
