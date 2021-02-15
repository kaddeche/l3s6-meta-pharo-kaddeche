Class {
	#name : #CHInterpreterTest,
	#superclass : #TestCase,
	#instVars : [
		'receiver',
		'collaborator'
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

{ #category : #'as yet unclassified' }
CHInterpreterTest >> peanoToInt: aPeanoNumber [ [
	"Helper method to transform a peano number to a normal Pharointeger"
	^ aPeanoNumber
		ifEmpty: [ 0 ]
		ifNonEmpty: [ 1 + (self peanoToInt: aPeanoNumber first) ]
]
]

{ #category : #running }
CHInterpreterTest >> setUp [ [
	super setUp.
	receiver := CHInterpretable new.
	collaborator := CHInterpretable new.
	receiver collaborator: collaborator
]
]

{ #category : #tests }
CHInterpreterTest >> testArgumentAccess [ [
	receiver x: 200.
	collaborator x: 300.
	self executeSelector: #changeCollaboratorWithArgument.
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 500
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
CHInterpreterTest >> testBalancingStack [ [
	self
		assert: (self executeSelector: #setXAndMessage)
		equals: 1000
]
]

{ #category : #tests }
CHInterpreterTest >> testEvaluationOrder [ [
	| argumentEvaluationOrder |
	argumentEvaluationOrder := self executeSelector:#returnEvaluationOrder.
	self assert: (self peanoToInt: receiver evaluationOrder) equals: 0.
	self 
		assert: (argumentEvaluationOrder collect:
		[ :peano | self peanoToInt: peano])
		equals: #(1 2 3)
	]
]

{ #category : #tests }
CHInterpreterTest >> testInstanceVariableStoreInMethodActivationDoesNotChangeSender [ [
	receiver x: 200.
	collaborator x: 300.
	"changeCollaboratorX will replace collaborator's x but not thereceiver's"
	self executeSelector: #changeCollaboratorX.
	self assert: receiver x equals: 200.
	self assert: collaborator x equals: 100
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
CHInterpreterTest >> testSelfSend [ [
	receiver x: 100.
	self
		assert: (self executeSelector: #sendMessageReturnX)
		equals: 100
]
]

{ #category : #tests }
CHInterpreterTest >> testStore100IntoX [ [
	receiver x: 17.
	self executeSelector: #store100IntoX.
	self assert: receiver x equals: 100
]
]

{ #category : #tests }
CHInterpreterTest >> testUnassignedTempHasNilValue [ [
	self
	assert: (self executeSelector: #returnUnassignedTemp)
	equals: nil
]
]

{ #category : #tests }
CHInterpreterTest >> testWriteTemporaryVariable [ [
	self
	assert: (self executeSelector: #writeTemporaryVariable)
	equals: 100
]
]

{ #category : #tests }
CHInterpreterTest >> visitMessageNode: aMessageNode [ [
	| newReceiver method |
	newReceiver := self visitNode: aMessageNode receiver.
	method := (newReceiver class compiledMethodAt: aMessageNode
		selector) ast.
	^ self execute: method withReceiver: newReceiver
]
]
