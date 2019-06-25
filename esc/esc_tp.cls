% esc/esc_tp class
% by Francesco Servida
% School of Criminal Justice - University of Lausanne
% Created: 2019 June
% Last Edit: 2019 June

% Description:
% This class is useful to produce standardized evaluation reports for TPs of the School of Criminal Justice - A similar docx version is also available for non LaTeX lovers
%
% Usage:
% Copy and uncomment the follow section in the preamble of your document, fill parameters as needed
%%%% VARIABLES %%%%
%\newcommand{\students}{Etudiant E, Etudiant Et}
%\newcommand{\assistant}{Assistant A}
%\newcommand{\note}{4.5}
%\newcommand{\tp}{Pratique Forensique}
%%%% END VARIABLES %%%%

\NeedsTeXFormat{LaTeX2e} % Mandatory - Specifies LaTeX minimum version for this class
\ProvidesClass{esc_tp}[2019/06/24 Classe LaTeX pour travaux pratiques de l'ESC] % Mandatory - Class name and basic infos

\LoadClass[a4, 12pt]{article} % Parent class we reuse

\RequirePackage[utf8]{inputenc} % UTF8 support for accents and special chars directly in text (without need for macros)
\RequirePackage[a4paper, left=2cm, right=2cm, top=1cm, bottom=3cm, includeheadfoot]{geometry} % Advanced page layout manipulation, useful when redefining headers height
\RequirePackage{fancyhdr} % Advanced header customization
\RequirePackage{lastpage} % Automatically set a label on the last page to reference in the footer for "Page x sur lastpage"
\RequirePackage{graphicx} % Image/Figure handling (includegraphics)
\RequirePackage[sc]{titlesec} % Section titles in smallcaps
\RequirePackage{lipsum} % Text filler, always useful
\RequirePackage{xparse} % Advanced command definition with multiple optional parameters


\setlength{\headheight}{70pt} % Correct header height to account for logo and multiple header lines

% Fancyhdr - Custom Headers for TP evaluation sheet
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Header for first page
% \thispagestyle{esc_tp_firstpage} needs to be present just after \begin{document}
\fancypagestyle{esc_tp_firstpage}{%
    \fancyhf{}
    \lhead{\parbox[][\headheight][c]{0.5\textwidth}{
    \includegraphics[width=0.2\textwidth]{esc/ESC_Logo.png} \\
    Etudiant(e)(s): \students \\
    Assistant: \assistant
    }
    }
    \chead{\parbox[][\headheight][t]{0.5\textwidth}{\begin{center}\Large \tp \end{center}}}
    \rhead{\parbox[][\headheight][b]{0.5\textwidth}{\begin{flushright}\textbf{Note des rendus: \note/6}\end{flushright}}}
    \lfoot{\today}
    \rfoot{Page \thepage{} sur \pageref{LastPage}}
}

% Default Header
\fancypagestyle{esc_tp}{%
    \fancyhf{}
    \lhead{\parbox[][\headheight][b]{0.5\textwidth}{
    Etudiant(e)(s): \students \\
    }}
    \chead{\parbox[][\headheight][t]{0.5\textwidth}{
        \begin{center}\Large \tp \end{center}
    }}
    \rhead{\parbox[][\headheight][b]{0.5\textwidth}{
        \begin{flushright}
            Assistant: \assistant \\ 
        \end{flushright}
    }}
    \lfoot{\today}
    \rfoot{Page \thepage{} sur \pageref{LastPage}}
}

\pagestyle{esc_tp} % Set esc_tp as default page style

\newcommand{\tpsection}[2][]{
    \section{#2}\IfNoValueTF{#1}{}{\begin{flushright}\large\textsc{Appreciation: #1}\end{flushright}}
}