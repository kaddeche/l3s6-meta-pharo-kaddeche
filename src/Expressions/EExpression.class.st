Class {
	#name : #EExpression,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #arithmetic }
EExpression >> negated [

	^ ENegation new expression: self
]
