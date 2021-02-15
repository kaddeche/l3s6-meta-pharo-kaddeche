Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'globalScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #visiting }
CHInterpreter >> currentScope [ [
	^ CHInstanceScope new
		receiver: self receiver;
		parentScope: globalScope;
		yourself
]
]

{ #category : #running }
CHInterpreter >> execute: anAST [ [
	^ self visitNode: anAST
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> execute: anAST withReceiver: anObject [ [
	receiver := anObject.^ self visitNode: anAST
]
]

{ #category : #initialization }
CHInterpreter >> globalEnvironmentAt: aSymbol put: anObject [ [
	globalScope at: aSymbol put: anObject
]
]

{ #category : #initialization }
CHInterpreter >> initialize [ [
	super initialize.
	globalScope := CHGlobalScope new
]
]

{ #category : #accessing }
CHInterpreter >> receiver [ [
	^ receiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> scopeDefining: aName [ [
	^ self currentScope scopeDefining: aName
]
]

{ #category : #visiting }
CHInterpreter >> visitAssignmentNode: anAssignmentNode [ [
	| value |
	value := self visitNode: anAssignmentNode value.
	(self scopeDefining: anAssignmentNode variable name)
		write: anAssignmentNode variable name
		withValue: value.
	^ value
]
]

{ #category : #visiting }
CHInterpreter >> visitGlobalNode: aRBGlobalNode [ [
	^ self globalEnvironment
		at: aRBGlobalNode name
		ifAbsent: [ self error: aRBGlobalNode name, ' not found' ]
	]
]

{ #category : #visiting }
CHInterpreter >> visitLiteralArrayNode: aLiteralArrayNode [ [
	^ aLiteralArrayNode contents
		collect: [ :literalNode | self visitNode: literalNode ]
		as: Array
]
]

{ #category : #visiting }
CHInterpreter >> visitLiteralValueNode: aLiteralValueNode [ [
	^ aLiteralValueNode value
]
]

{ #category : #visiting }
CHInterpreter >> visitMethodNode: aMethodNode [ [
	^ self visitNode: aMethodNode body
]
]

{ #category : #visiting }
CHInterpreter >> visitNode: aNode [ [
	^ aNode acceptVisitor: self
	]
]

{ #category : #visiting }
CHInterpreter >> visitReturnNode: aReturnNode [ [
	^ self visitNode: aReturnNode value
]
]

{ #category : #visiting }
CHInterpreter >> visitSequenceNode: aSequenceNode [ [
	"Visit all but the last statement without caring about the result"
	aSequenceNode statements allButLast
	do: [ :each | self visitNode: each ].
	^ self visitNode: aSequenceNode statements last
]
]

{ #category : #visiting }
CHInterpreter >> visitSuperNode: aNode [ [
	^ self receiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> visitVariableNode: aVariableNode [ [
	^ (self scopeDefining: aVariableNode name) read: aVariableNode name
]
]
