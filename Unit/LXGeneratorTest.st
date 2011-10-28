TestCase subclass: LXGeneratorTest [

	<category: 'LatexBuilder'>
	<comment: nil>

	testPrintDocument [
		| doc generator |
		doc := LXDocument new.
		doc chapter text: 'Foo'.
		
		generator := LXGenerator new.
		self assert: (generator print: doc) = '\begin{document}
\chapter{Foo}
\end{document}
'
	]
]
