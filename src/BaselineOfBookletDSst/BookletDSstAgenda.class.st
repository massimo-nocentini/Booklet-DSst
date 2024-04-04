Class {
	#name : 'BookletDSstAgenda',
	#superclass : 'Object',
	#category : 'BaselineOfBookletDSst',
	#package : 'BaselineOfBookletDSst'
}

{ #category : 'TeX chunks' }
BookletDSstAgenda >> beamerTeXString [

	<tex: 'pdflatex' times: 2 pagesPerRow: 1>
	'
\documentclass{beamer}
\usetheme{Boadilla}
\title{Smalltalk projects agenda}
\subtitle{Ideas and TODOs}
\author{Massimo Nocentini}
\date{\today}

\begin{document}

\frame{\titlepage}


\begin{frame}
\frametitle{\texttt{tree-sitter}}

Introduce the compilation of that library.

\begin{block}{ Unix }
Have a look at \url{https://github.com/tree-sitter/tree-sitter/releases/latest}.
\end{block}

\begin{block}{ Windows }
Otherwise \url{https://packages.msys2.org/package/mingw-w64-ucrt-x86_64-tree-sitter?repo=ucrt64}.
\end{block}

Then, introduce a pragma to show in a \texttt{Calypso} tab the syntax-highlighted chunk of code.

\end{frame}

\begin{frame}
\frametitle{\texttt{tree-sitter}}
\begin{alertblock}{Lua in the middle}
Pay attention that currently a Lua module is used to talk with that library, consider introducing
a VM plugin to do the same.
\end{alertblock}

\begin{alertblock}{Grammars}
Grammars should be compiled as well because they are defined in indipendent repositories, for instance
\url{https://github.com/tree-sitter/tree-sitter-c}.
\end{alertblock}

\end{frame}


\begin{frame}
\frametitle{\texttt{timsort}}

Refactor the actual implementation using key-value structures to just have a single call for each item.
\end{frame}


\begin{frame}
\frametitle{\texttt{non layered tidy trees} layout}

Use the more comprehensive C API function instead of going through Lua.

\end{frame}

\end{document}
'
]
