TestCase subclass: LXItemTest [

	<category: 'LatexBuilder'>
	<comment: nil>

	testAddingEnvironment [
		<category: 'testing'>
		| item |
	
		item := LXItem new.
		item addEnvironment: 'itemize'.
		self assert: (item children first isKindOf: LXEnvironment).
		self assert: item children first tag = 'itemize'
	]

	testAddingItem [
		<category: 'testing'>
		| item |
		item := LXItem new.
		item addItem: 'textit'.
		self assert: (item children first isKindOf: LXItem).
		self assert: item children first tag = 'textit'	
	]

	testAddingItemWithoutArgument [
		<category: 'testing'>
		| item |
		item := LXItem new.
		item addItemWithoutArgument: 'item'.
		self assert: (item children first isKindOf: LXNoArgumentItem).
		self assert: item children first tag = 'item'
	]

	testAddingRemoving [
		<category: 'testing'>
		| item1 item2 item3 |
		
		item1 := LXItem new.
		item2 := LXItem new.
		item3 := LXItem new.
		
		self assert: item1 children isEmpty.
		
		item1 add: item2.
		item2 add: item3.
	
		self assert: (item1 children includes: item2).
		self assert: (item2 children includes: item3).
		self deny: (item1 children includes: item3).
		
		item1 remove: item2.
		self deny: (item1 children includes: item2)
	]

	testOptions [
		<category: 'testing'>
		| item |
		item := LXItem new.
	
		self assert: item options isEmpty.
	
		item optionAt: 'foo' put: 'bar'.
		item addOption: 'baz'.
	
		self assert: (item options at: 'foo') = 'bar'.
		self assert: (item options at: 'baz') = ''
	]
	
	testTag [
		<category: 'testing'>
		| item |
		item := LXItem tag: 'paragraph'.
		self assert: item tag = 'paragraph'
	]
]
