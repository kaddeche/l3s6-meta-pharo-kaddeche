Class {
	#name : #CHInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'interpreter',
		'receiver'
	],
	#category : #'Champollion-Tests'
}

{ #category : #'as yet unclassified' }
CHInterpreterTest >> executeSelector: aSymbol [ | selector |
[
	^ self executeSelector: selector withReceiver: receiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreterTest >> executeSelector: aSymbol withReceiver:aReceiver [ [
	| ast |
	ast := (CHInterpretable >> aSymbol) parseTree.
	^ self interpreter execute: ast withReceiver: aReceiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreterTest >> interpreter [ [
	^ CHInterpreter new
]
]

{ #category : #running }
CHInterpreterTest >> setUp [ [
	super setUp.
	receiver := CHInterpretable new
]
]

{ #category : #tests }
CHInterpreterTest >> testAssignmentReturnsAssignedValue [ [
	self
		assert: (self executeSelector: #store100IntoX)
		equals: 100
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
CHInterpreterTest >> testReturnGlobal [ [
	| globalObject |
	globalObject := Object new.
	interpreter globalEnvironmentAt: #Global put: globalObject.
	self assert: (self executeSelector: #returnGlobal) equals:
		globalObject
]
]

{ #category : #'as yet unclassified' }
CHInterpreterTest >> testReturnInstanceVariableRead [ [
	receiver x: 100.
	self
	assert: (self executeSelector: #returnX)
	equals: 100
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

{ #category : #'as yet unclassified' }
CHInterpreterTest >> testReturnSelf [ [
	"Convey our intention of checking identity by using an explicitidentity check"
	self assert: (self
		executeSelector: #returnSelf
		withReceiver: receiver)
		== receiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreterTest >> testReturnSuper [ [
	"Convey our intention of checking identity by using an explicitidentity check"
	self assert: (self
		executeSelector: #returnSelf
		withReceiver: receiver)== receiver
	]
]

{ #category : #tests }
CHInterpreterTest >> testStore100IntoX [ [
	receiver x: 17.
	self executeSelector: #store100IntoX.
	self assert: receiver x equals: 100
]
]
