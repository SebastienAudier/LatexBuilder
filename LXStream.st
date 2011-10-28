Object subclass: LXStream [
	| underlyingStream |

	<category: 'LatexBuilder'>
	<comment: 'LXStream has not been documented yet. The class comment should describe the purpose of the class, its collaborations and its variables.'>

	LaTeXCharacters := nil.

	LXStream class [
		
		on: aString [
			<category: 'instance creation'>
			^self new
				setStream: aString writeStream;
				yourself
		]

		initialize [
			<category: 'initialization'>
			self initLaTeXCharacters
		]

		initLaTeXCharacters [
			<category: 'initialization'>
			LaTeXCharacters := Dictionary new.
			LaTeXCharacters
				at: $# put: '\#';
				at: $& put: '\&';
				at: $% put: '\%';
				at: $$ put: '\$';
				at: ${ put: '\{';
				at: $} put: '\}';
				at: $_ put: '\_';
				at: $" put: '\symbol{34}';
			
				at: $[ put: '{[}';
				at: $] put: '{]}';
				at: $| put: '$|$';
				at: $< put: '$<$';
				at: $> put: '$>$';
				at: $/ put: '$/$';
				at: $\ put: '$\backslash$';
				at: $^ put: '$\uparrow$';
		
				at: ('ä' first) put: '\"{a}';
				"at: 'à' first put: '\""{A}';"
				at: ('ë' first) put: '\"{e}';
				"at: ('à' first) put: '\""{E}';"
				at: ('ï' first) put: '\"{i}';
				"at: ('à' first) put: '\""{I}';"
				at: ('ö' first) put: '\"{o}';
				"at: ('à' first) put: '\""{O}';"
				at: ('ü' first) put: '\"{u}';
				"at: ('à' first) put: '\""{U}';"
				at: ('ÿ' first) put: '\"{y}';
		
				at: ('â' first) put: '\^{a}';
				"at: ('à' first) put: '\^{A}';"
				at: ('ê' first) put: '\^{e}';
				"at: ('à' first) put: '\^{E}';"
				at: ('î' first) put: '\^{i}';
				"at: ('à' first) put: '\^{I}';"
				at: ('ô' first) put: '\^{o}';
				"at: ('à' first) put: '\^{O}';"
				at: ('û' first) put: '\^{u}';
				at: ('Ü' first) put: '\^{U}';
				" -- "
				"at: ('à' first)  put: '\`{a}';"
				"at: ('à' first) put: '\`{A}';"
				at: ('è' first) put: '\`{e}';
				"at: ('à' first) put: '\`{E}';"
				"at: $i  put: '\`{i}';"
				"at: ('à' first) put: '\`{I}';"
				"at: $o put: '\`{o}';"
				"at: ('à' first) put: '\`{O}';"
				"at: $u put: '\`{u}';"
				"at: ('à' first) put: '\`{U}';"
				" -- "
				"at: $a¡ put: '\''{a}';"
				"at: ('à' first) put: '\''{A}';"
				at: ('é' first) put: '\''{e}';
				"at: ('à' first) put: '\''{E}';"
				"at: $i­ put: '\''{i}';"
				"at: ('à' first) put: '\''{I}';"
				"at: $o put: '\''{o}';"
				"at: ('à' first) put: '\''{O}';"
				"at: $u put: '\''{u}';"
				"at: ('à' first) put: '\''{U}';"
				" -- "
				at: ('ç' first) put: '\c{c}';
				"at: ('à' first) put: '\c{C}';"
				" -- "
				at: ('~' first) put: '\~{}'
				"at: $n put: '\~{n}';"
				"at: $N put: '\~{N}'"	
		]
	]

	contents [
		<category: 'accessing'>
		^underlyingStream contents
	]

	setStream: aStream [
		<category: 'accessing'>
		underlyingStream := aStream
	]

	comment: aString [
		<category: 'writing'>
		underlyingStream nextPut: $%.
		self nextPutAll: aString.
		underlyingStream nextPut: Character nl
	]

	cr [
		<category: 'writing'>
		
	]

	lf [
		<category: 'writing'>	
	]

	nextPut: aCharacter [
		<category: 'writing'>
		underlyingStream nextPutAll: (LaTeXCharacters 
			at: aCharacter 
			ifPresent: [:string | string]
			ifAbsent: [String with: aCharacter])
	]
	
	nextPutAll: aCollection [
		<category: 'writing'>
		aCollection do: [:each | self nextPut: each]
	]

	print: anObject [
		<category: 'writing'>
		anObject printLaTeXOn: self
	]

	printCloseEnvironmentFor: anEnvironment [
		<category: 'writing'>
		underlyingStream nextPutAll: '\end{'.
		self nextPutAll: anEnvironment tag.
		underlyingStream
			nextPut: $};
			nl
	]

	printEnvironment: anEnvironment [
		<category: 'writing'>
		self printOpenEnvironmentFor: anEnvironment.
		self printOptionsFor: anEnvironment.
		underlyingStream nl.
	
		anEnvironment children do: [:each | self print: each].
		
		self printCloseEnvironmentFor: anEnvironment
	]

	printItem: anItem [
		<category: 'writing'>
		underlyingStream
			nextPut: $\;
			nextPutAll: anItem tag.
		self printOptionsFor: anItem.
		underlyingStream nextPut: ${.
		anItem children do: [:each | self print: each].
		underlyingStream nextPut: $}.
		underlyingStream nl
	]

	printItemWithoutArgument: anItem [
		<category: 'writing'>
		underlyingStream
			nextPut: $\;
			nextPutAll: anItem tag.
		self printOptionsFor: anItem.
		underlyingStream
			nextPut: Character space.
		anItem children do: [:each | self print: each].
		underlyingStream nl
	]

	printLaTeX: aString [
		<category: 'writing'>
		underlyingStream nextPutAll: aString
	]

	printOpenEnvironmentFor: anEnvironment [
		<category: 'writing'>
		underlyingStream
			nextPutAll: '\begin{';
			nextPutAll: anEnvironment tag;
			nextPut: $}
	]

	printOptionsFor: anItem [
		<category: 'writing'>
		anItem options isEmpty ifFalse: [
			underlyingStream nextPut: $[.
				anItem options associations
					do: [:each |
						self nextPutAll: each key.
						each value notEmpty ifTrue: [
							underlyingStream nextPutAll: $=.
							self nextPutAll: each value]]
					separatedBy: [
						underlyingStream nextPut: $,].
			underlyingStream nextPut: $]]
	]

	printTabular: anEnvironment [
		<category: 'writing'>
		self printOpenEnvironmentFor: anEnvironment.
		self printOptionsFor: anEnvironment.
		self printTabularSpecFor: anEnvironment.
			
		underlyingStream nl.
		
		anEnvironment children do: [:each | self print: each].
		
		self printCloseEnvironmentFor: anEnvironment	
	]

	printTabularSpecFor: anItem [
		<category: 'writing'>
		anItem spec isEmpty ifFalse: [
			underlyingStream nextPut: ${.
			underlyingStream nextPutAll: anItem spec.
			underlyingStream nextPut: $}]
	]

]

Eval [LXStream initialize]
