Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#instVars : [
		'stack',
		'globalScope'
	],
	#category : #'Champollion-Core'
}

{ #category : #private }
CHInterpreter >> currentScope [ [
	^ self topFrame
]
]

{ #category : #running }
CHInterpreter >> execute: anAST [ [
	^ self visitNode: anAST
]
]

{ #category : #accessing }
CHInterpreter >> execute: anAST withReceiver: anObject [ | globalScope |
[
	| result |
	self pushNewFrame.
	"Set up the scope chain"
	self topFrame parentScope: (CHInstanceScope new
		receiver: anObject;
		parentScope: globalScope;
		yourself);
		yourself.
		self topFrame receiver: anObject.
		result := self visitNode: anAST.
		self popFrame.
		^ result
]
]

{ #category : #visiting }
CHInterpreter >> execute: anAST withReceiver: anObject andArguments:
	aCollection [ | globalScope |
[
		| result |
		self pushNewFrame.
		"Set up the scope chain"
		self topFrame parentScope: (CHInstanceScope new
		receiver: anObject;
		parentScope: globalScope;
		yourself);
		yourself.
		self topFrame receiver: anObject.
		anAST arguments
			with: aCollection
			do: [ :arg :value | self topFrame at: arg name put: value ].
			result := self visitNode: anAST.self popFrame.
			^ result
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> executeMethod: anAST withReceiver: anObject [ [
	self pushNewFrame.
	self topFrame receiver: anObject.
	result := self visitNode: anAST.
	self popFrame.
	^ result
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> executeMethod: anAST withReceiver: anObject
	andArguments: aCollection [ [
	| result |
	self pushNewFrame.
	self topFrame parentScope: (CHInstanceScope new
	receiver: anObject;
	parentScope: globalScope;
	yourself);
	yourself.
	self topFrame receiver: anObject.
	anAST arguments with: aCollection do: [ :arg :value | self tempAt:
		arg name put: value ].
	anAST temporaryNames do: [ :tempName | self tempAt: tempName name
		put: nil ].
	result := self visitNode: anAST body.
	self popFrame.
	^ result 
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
	stack := CTStack new.
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> popFrame [ [
	stack pop
]
]

{ #category : #accessing }
CHInterpreter >> receiver [ [
	^ self topFrame receiver
]
]

{ #category : #'as yet unclassified' }
CHInterpreter >> scopeDefining: aName [ [
	^ self currentScope scopeDefining: aName
]
]

{ #category : #accessing }
CHInterpreter >> topFrame [ [
	^ stack top
]
]

{ #category : #accessing }
CHInterpreter >> ushNewFrame [ [
	| newTop |
	newTop := CHMethodScope new.
	stack push: newTop.
	^ newTop
]
]

{ #category : #visiting }
CHInterpreter >> visitArrayNode: aRBArrayNode [ [
	^ aRBArrayNode statements
	collect: [ :e | self visitNode: e ]
	as: Array
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
CHInterpreter >> visitMessageNode: aMessageNode [ [
	| newReceiver method args |
	newReceiver := self visitNode: aMessageNode receiver.
	args := aMessageNode arguments collect: [ :each | self visitNode:
		each ].
	method := (newReceiver class compiledMethodAt: aMessageNode
	selector) ast.
	^ self executeMethod: method withReceiver: newReceiver
	andArguments: args
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
