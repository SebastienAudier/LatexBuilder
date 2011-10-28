LXItem subclass: LXEnvironment [

	<category: 'LatexBuilder'>
	<comment: 'LXEnvironment has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	printLaTeXOn: aStream [
		<category: 'printing'>
		aStream printEnvironment: self
	]
]
