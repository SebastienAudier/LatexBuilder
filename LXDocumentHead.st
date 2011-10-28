LXItem subclass: LXDocumentHead [

	<category: 'LatexBuilder'>
	<comment: 'LXDocumentHead has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	author [
		<category: 'convenience'>
		^self addItem: 'author'
	]

	author: aString [
		<category: 'convenience'>
		^self author
			text: aString;
			yourself
	]

	date [
		<category: 'convenience'>
		^self addItem: 'date'
	]

	date: aString [
		<category: 'convenience'>
		^self date
			text: aString;
			yourself
	]

	documentclass [
		<category: 'convenience'>
		^self addItem: 'documentclass'
	]
	
	documentclass: aString [
		<category: 'convenience'>
		^self documentclass
			text: aString;
			yourself
	]

	title [
		<category: 'convenience'>
		^self addItem: 'title'
	]

	title: aString [
		<category: 'convenience'>
		^self title
			text: aString;
			yourself
	]

	usepackage [
		<category: 'convenience'>
		^self addItem: 'usepackage'
	]

	usepackage: aString [
		<category: 'convenience'>
		^self usepackage
			text: aString;
			yourself
	]

	printLaTeXOn: aStream [
		<category: 'convenience'>
		self children do: [:each | aStream print: each]
	]
]

