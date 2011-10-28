LXItem subclass: LXRawLaTeXItem [
	| contents |
	
	<category: 'LatexBuilder'>
	<comment: 'LXRawLaTeXItem has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	contents [
		<category: 'accessing'>
		^contents ifNil: ['']
	]

	contents: aString [
		<category: 'accessing'>
		contents := aString
	]

	add: anItem [
		<category: 'adding/removing'>
		self shouldNotImplement
	]

	printLaTeXOn: aStream [
		<category: 'adding/removing'>
		aStream printLaTeX: self contents
	]
]
