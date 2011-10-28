LXEnvironment subclass: LXTabular [
	| spec |

	<category: 'LatexBuilder'>
	<comment: 'LXTabular has bot been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>
		
	newCell [
		<category: 'accessing'>
		^self separator
	] 

	separator [
		<category: 'accessing'>
		^self latex: ' & '
	]

	spec [
		<category: 'accessing'>
		^spec
	]

	spec: aString [
		"example: '|l|l|r|c|"
		<category: 'accessing'>
		
		spec := aString
	]

	tag [
		<category: 'accessing'>
		^'tabular'
	]

	cline: aString [
		"example: self cline: 2-2"	
		<category: 'adding'>
		
		^(self addItem: 'cline')
			text: aString;
			yourself
	]

	hline [
		<category: 'adding'>
		^self addItem: 'hline'
	]

	newRow [
		<category: 'adding'>
		^self newline
	]

	printLaTeXOn: aStream [
		<category: 'printing'>
		aStream printTabular: self
	]
]
