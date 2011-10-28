LXItem subclass: LXNoArgumentItem [

	<category: 'LatexBuilder'>
	<comment: 'LXNoArgumentItem has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables'>

	printLaTeXOn: aStream [
		<category: 'Odyssey-Plugins-LatexBuilder'>
		aStream printItemWithoutArgument: self
	]
]
