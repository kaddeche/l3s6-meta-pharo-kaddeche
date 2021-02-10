Class {
	#name : #EExpression,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #visiting }
EExpression >> accept: aVisitor [ 

	self subclassResponsibility 
]

{ #category : #accessing }
EExpression >> evaluateWith: anObject [ 

	| visitor |
	visitor := EEvaluatorVisitor new.
	visitor bindings: anObject.
	^ self accept: visitor.
]

{ #category : #arithmetic }
EExpression >> negated [

	^ ENegation new expression: self
]
