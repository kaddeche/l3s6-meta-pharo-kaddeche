"
EprinterVisitor class
"
Class {
	#name : #EPrinterVisitor,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'Expressions-Model'
}

{ #category : #visiting }
EPrinterVisitor >> visitADivision: aDivision [

	| left right |
	left := aDivision left accept: self.
	right := aDivision right accept: self.
	^ '(', left , ' / ', right, ')'
]

{ #category : #visiting }
EPrinterVisitor >> visitAddition: anAddition [

	| left right |
	left := anAddition left accept: self.
	right := anAddition right accept: self.
	^ '(', left , ' + ', right, ')'
]

{ #category : #visiting }
EPrinterVisitor >> visitConstant: aConstant [
]

{ #category : #visiting }
EPrinterVisitor >> visitMultiplication: aMultiplication [

	| left right |
	left := aMultiplication left accept: self.
	right := aMultiplication right accept: self.
	^ '(', left, ' * ', right, ')'
]

{ #category : #visiting }
EPrinterVisitor >> visitNegation: aNegation [

	| subExpression |
	subExpression := aNegation expression accept: self.
	^ subExpression , ' negated'
]

{ #category : #visiting }
EPrinterVisitor >> visitVariable: aVariable [ 

	^ aVariable id asString 
]
