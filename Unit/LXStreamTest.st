TestCase subclass: LXStreamTest [
	
	<category: 'LatexBuilder'>
	<comment: nil>

	testPrintEnvironment [
		<category: 'testing'>
		| item str |

		item := LXEnvironment tag: 'enumerate'.
		item item text: 'My title'.
		str := LXStream on: ''.
		str print: item.
		self assert: str contents = '\begin{enumerate}
\item My title
\end{enumerate}
'
	]

	testPrintEscapedCharacters [
		<category: 'testing'>
		| str |
		str := LXStream on: ''.
		str nextPutAll: 'é\{'.
		self assert: str contents = '\''{e}$\backslash$\{'
	]

	testPrintItem [
		<category: 'testing'>
		| item str |
		item := LXItem tag: 'section'.
		item text: 'My title'.
		str := LXStream on: ''.
		str print: item.
		self assert: str contents = '\section{My title}
'
	]

	testPrintRawLatex [
		<category: 'testing'>
		| str |
		str := LXStream on: ''.
		str printLaTeX: '\texttt{}'.
		self assert: str contents = '\texttt{}'  
	]
]
