Class {
	#name : #CHInterpreterTest,
	#superclass : #TestCase,
	#category : #'Champollion-Tests'
}

{ #category : #'as yet unclassified' }
CHInterpreterTest >> executeSelector: aSymbol [ [
	| ast |
	ast := (CHInterpretable >> aSymbol) parseTree.
	^ self interpreter execute: ast
]
]

{ #category : #'as yet unclassified' }
CHInterpreterTest >> interpreter [ [
	^ CHInterpreter new
]
]

{ #category : #tests }
CHInterpreterTest >> testReturnBoolean [ [
	"Do not use deny: to make explicit that we expect the value false"
	self
		assert: (self executeSelector: #returnBoolean)
		equals: false
]
]

{ #category : #tests }
CHInterpreterTest >> testReturnEmptyLiteralArray [ [
	self
		assert: (self executeSelector: #returnEmptyLiteralArray)
		equals: #()
]
]

{ #category : #tests }
CHInterpreterTest >> testReturnFloat [ [
	self
	assert: (self executeSelector: #returnFloat)
	equals: 3.14
]
]

{ #category : #tests }
CHInterpreterTest >> testReturnInteger [ [
	self
	assert: (self executeSelector: #returnInteger)
	equals: 5
]
]

{ #category : #tests }
CHInterpreterTest >> testReturnRecursiveLiteralArray [ [
	self
		assert: (self executeSelector: #returnRecursiveLiteralArray)
		equals: #(true 1 #('ahah'))
]
]
