Object subclass: LXItem [
	| tag options children |
	
	<category: 'LatexBuilder'>
	<comment: 'LXItem has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	LXItem class >> tag: aString [
		<category: 'instance creation'>
		^self new
			tag: aString;
			yourself
	]

	children [
		<category: 'accessing'>
		^children ifNil: [children := OrderedCollection new]
	]
	

	do: aBlock [
		<category: 'accessing'>
		^aBlock value: self
	]

	options [
		<category: 'accessing'>
		^options ifNil: [options := Dictionary new]
	]

	tag [
		<category: 'accessing'>
		^tag
	]

	tag: aString [
		<category: 'accessing'>
		tag := aString
	]

	comment: aString [
		<category: 'adding'>
		self 
			latex: '%';
			text: aString;
			latex: (String with: Character cr)
	]

	latex: aString [
		<category: 'adding'>
		^self add: (LXRawLaTeXItem new
			contents: aString;
			yourself)
	]
	

	newline [
		<category: 'adding'>
		self latex: '\\ '	
	]

	enumerate [
		<category: 'adding lists'>
		^self addEnvironment: 'enumerate'
	]


	item [
		<category: 'adding lists'>
		^self addItemWithoutArgument: 'item'
	]

	item: aString [
		<category: 'adding lists'>
		^self item
			text: aString;
			yourself
	]	
	
	itemize [
		<category: 'adding lists'>
		^self addEnvironment: 'itemize'
	]

	chapter [
		<category: 'adding sections'>
		^self addItem: 'chapter'
	]	

	chapter: aString [
		<category: 'adding sections'>
		^self chapter
			text: aString;
			yourself
	]

	chapterStar [
		<category: 'adding sections'>
		^self addItem: 'chapter*'
	]

	chapterStar: aString [
		<category: 'adding sections'>
		^self chapterStar
			text: aString;
			yourself
	]

	paragraph [
		<category: 'adding sections'>
		^self addItem: 'paragraph'
	]

	paragraph: aString [
		<category: 'adding sections'>
		^self paragraph
			text: aString;
			yourself
	]

	part [
		<category: 'adding sections'>
		^self addItem: 'part'
	]
			
	part: aString [
		<category: 'adding sections'>
		^self part
			text: aString;
			yourself
	]
	
	partStar [
		<category: 'adding sections'>
		^self addItem: 'partStar'
	]
	
	partStar: aString [
		<category: 'adding sections'>
		^self partStar
			text: aString;
			yourself
	]
	
	section [
		<category: 'adding sections'>
		^self addItem: 'section'
	]
	
	section: aString [
		<category: 'adding sections'>
		^self section
			text: aString;
			yourself
	]
	
	sectionStar [
		<category: 'adding sections'>
		^self addItem: 'section*'
	]

	sectionStar: aString [
		<category: 'adding sections'>
		^self sectionStar
			text: aString;
			yourself
	]

	subsection [
		<category: 'adding sections'>
		^self addItem: 'subsection'
	]

	subsection: aString [
		<category: 'adding sections'>
		^self subsection
			text: aString;
			yourself
	]

	subsectionStar [
		<category: 'adding sections'>
		^self addItem: 'subsectionStar'
	]

	subsectionStar: aString [
		<category: 'adding sections'>
		^self subsectionStar
			text: aString;
			yourself
	]

	subsubsection [
		<category: 'adding sections'>
		^self addItem: 'subsubsection'
	]

	subsubsection: aString [
		<category: 'adding sections'>
		^self subsubsection
			text: aString;
			yourself
	]

	subsubsectionStar [
		<category: 'adding sections'>
		^self addItem: 'subsubsectionStar'
	]

	subsubsectionStar: aString [
		<category: 'adding sections'>
		^self subsubsectionStar
			text: aString;
			yourself
	]	

	tabular [
		<category: 'adding tables'>
		^self add: (LXTabular new)
	]

	text: aString [
		<category: 'adding text'>
		^self add: aString
	]

	textbf [
		<category: 'adding text'>
		^self addItem: 'textbf'
	]

	textbf: aString [
		<category: 'adding text'>
		^self textbf
			text: aString;
			yourself	
	]
	
	textit [
		<category: 'adding text'>
		^self addItem: 'textit'
	]

	textit: aString [
		<category: 'adding text'>
		^self textit
			text: aString;
			yourself
	]

	textsf [
		<category: 'adding text'>
		^self addItem: 'textsf'
	]

	textsf: aString [
		<category: 'adding text'>
		^self textsf
			text: aString;
			yourself
	]

	texttt [
		<category: 'adding text'>
		^self addItem: 'texttt'
	]
	
	texttt: aString [
		<category: 'adding text'>
		^self texttt
			text: aString;
			yourself
	]
	
	verbatim [
		<category: 'adding text'>
		^self addEnvironment: 'verbatim'
	]

	add: anItem [
		<category: 'adding/removing'>
		^self children add: anItem
	]

	addEnvironment: aString [
		<category: 'adding/removing'>
		^self add: (LXEnvironment tag: aString)
	]	
	
	addItem: aString [
		<category: 'adding/removing'>
		^self add: (LXItem tag: aString)
	]

	addItemWithoutArgument: aString [
		<category: 'adding/removing'>
		^self add: (LXNoArgumentItem tag: aString)
	]

	addOption: aString [
		<category: 'adding/removing'>
		self options at: aString put: ''
	]
	
	option: aString [
		<category: 'adding/removing'>
		self addOption: aString
	]

	optionAt: aKey [
		<category: 'adding/removing'>
		^self options at: aKey ifAbsent: [nil]
	]

	optionAt: aKey put: aValue [
		<category: 'adding/removing'>
		^self options at: aKey put: aValue
	]

	remove: anItem [
		<category: 'adding/removing'>
		self children remove: anItem
	]

	removeOption: aString [
		<category: 'adding/removing'>
		self options removeKey: aString ifAbsent: []
	]

	printLaTeXOn: aStream [
		<category: 'printing'>
		aStream printItem: self
	]

	printOn: aStream [
		<category: 'printing'>
		super printOn: aStream.
		aStream nextPutAll: ' (', self tag, ')'
	]
]

