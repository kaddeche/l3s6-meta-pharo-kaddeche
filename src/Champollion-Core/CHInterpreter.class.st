Class {
	#name : #CHInterpreter,
	#superclass : #Object,
	#category : #'Champollion-Core'
}

{ #category : #running }
CHInterpreter >> execute: anAST [ [
	^ self visitNode: anAST
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
