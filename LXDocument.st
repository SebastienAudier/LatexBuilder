LXItem subclass: LXDocument [
	| head root |	
	
	<category: 'LatexBuilder'>
	<comment: 'LXDocument has not documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	head [
		<category: 'accessing'>
		^head ifNil: [head := self children addFirst: (LXDocumentHead new)]
	]
	
	root [
		<category: 'accessing'>
		^root ifNil: [root := self children add: (LXEnvironment tag: 'document')]
	]

	add: anitem [
		<category: 'adding/removing'>
		^self root add: anitem
	]	

	remove: anItem [
		<category: 'adding/removing'>
		self root remove: anItem
	]

	maketitle [
		<category: 'convenience'>
		^self addItemWithoutArgument: 'maketitle'
	]	

	tableofcontents [
		<category: 'convenience'>
		^self addItemWithoutArgument: 'tableofcontents'
	]

	printLaTeXOn: aStream [
		<category: 'printing'>
		self children do: [:each | aStream print: each]
	]
]
