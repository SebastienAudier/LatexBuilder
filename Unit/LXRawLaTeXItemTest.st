TestCase subclass: LXRawLaTeXItemTest [
	
	<category: 'LatexBuilder'>
	<comment: nil>
	
	testAdding [
		<category: 'testing'>
		self should: [LXRawLaTeXItem new add: 'foo'] raise: Error
	]
]
