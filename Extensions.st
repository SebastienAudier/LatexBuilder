Object extend [
	
	
    printLaTeXOn: aStream [
	<category: '*LatexBuilder'>
	aStream nextPutAll: self asString
    ]

    asString [
	<category: '*LatexBuilder'>
	^self printString
    ]
]

Dictionary extend [
	
     at: aKey ifAbsent: aBlock ifPresent: anotherBlock [
	<category: 'LatexBuilder'>
     	self at: aKey
		ifAbsent: [^aBlock value].
	^anotherBlock value: (self at: aKey)
     ]

     at: aKey ifPresent: aBlock ifAbsent: anotherBlock [
	<category: 'LatexBuilder'>
     	^self at: aKey ifAbsent: anotherBlock ifPresent: aBlock
     ]
]
