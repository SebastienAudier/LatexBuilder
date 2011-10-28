Object subclass: LXGenerator [
	| directory |

	<category: 'LatexBuilder'>
	<comment: nil>
	
	LXGenerator class >> example1 [
		<category: 'accessing'>
		| doc |
		doc := LXDocument new.

		doc head documentclass: 'book'.
		(doc head usepackage: 'inputenc')
			option: 'utf8'.
	
		doc head title
			latex: '\LaTeX{}'; text: ' example'.
		doc head author: 'Nicolas Petton'.
		doc comment: 'Begin document'.

		doc maketitle.
		doc tableofcontents.

		doc section: 'First section'.
		doc paragraph: 'This is cool!'.

		^LXGenerator new print: doc
	]

	LXGenerator class >> example2 [
		<category: 'accessing'>
		| doc |
		doc := LXDocument new.

		doc head documentclass: 'article'.
		(doc head usepackage: 'inputenc')
		option: 'utf8'.
	
		doc head title
			latex: '\LaTeX{}'; text: ' example 2'.
		doc head author: 'Nicolas Petton'.
		doc comment: 'Begin document'.

		doc maketitle.

		doc section: 'Hello world'.
	
		doc enumerate do: [:enumerate |
			enumerate item texttt: 'petton.nicolas@gmail.com'.
			enumerate item: 'foo bar'].

		doc tabular
			spec: '| c c c |';
			do: [:tabular |
				tabular 
					text: 'Label 1';
					newCell;
					text: 'Label 2';
					newCell;
					text: 'Label 3';
				
					newRow;
					hline;
				
					text: 'Item 1';
					newCell;
					text: 'Item 2';
					newCell;
					text: 'Item 3'].

		^LXGenerator new processDocument: doc named: 'article'  

	]

	directory [
		<category: 'accessing'>
		^directory ifNil: [directory := Directory 
			working / 'pdf' / (((Random new next * 100000) asInteger) asString).
		directory parent exists ifFalse: [directory parent createDirectory].
		directory exists ifFalse: [directory createDirectory].
		directory]
	]

	directory: aString [
		<category: 'accessing'>
		directory := aString
	]	

	processDocument: aDocument named: aString [
		<category: 'Public'>
		(self directory / (aString, '.tex')) writeStream
			nextPutAll: (self print: aDocument);
			close.
		2 timesRepeat: [self runLaTeXOnFileNamed: aString].
		^self directory / (aString, '.pdf')
	]

	print: anItem [
		<category: 'private'>
		^(LXStream on: '') 
			print: anItem;
			contents
	]

	runLaTeXOnFileNamed: aString [
		<category: 'private'>
		Smalltalk
			system: 'pdflatex -output-directory ' , 
				self directory asString, 
					' -interaction batchmode ',  
						aString, '.tex'  
	]
]
