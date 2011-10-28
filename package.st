Eval [
    | builder |  
    builder := PackageBuilder new
	name: 'LatexBuilder';
	namespace: 'LatexBuilder';
    	prereq: 'SUnit';
   	testsBelow: 'Unit' matching: '*.st';


	filein: 'LXItem.st';
	filein: 'LXDocument.st';
	filein: 'LXEnvironment.st';
	filein: 'LXDocumentHead.st';
	filein: 'LXGenerator.st';
	filein: 'LXNoArgumentItem.st';
	filein: 'LXRawLaTeXItem.st';
	filein: 'LXStream.st';
	filein: 'LXTabular.st';

	filein: 'Unit/LXGeneratorTest.st';
	filein: 'Unit/LXItemTest.st';
	filein: 'Unit/LXRawLaTeXItemTest.st';
	filein: 'Unit/LXStreamTest.st';

	filein: 'Extensions.st';
	
	yourself.

	builder buildXml
]
