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
EExpression >> evaluateWith: aDictionary [

	^ self evaluate
]

{ #category : #arithmetic }
EExpression >> negated [

	^ ENegation new expression: self
]
