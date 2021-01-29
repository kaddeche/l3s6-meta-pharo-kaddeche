Class {
	#name : #EExpression,
	#superclass : #TestCase,
	#category : #Expressions
}

{ #category : #accessing }
EExpression >> evaluateWith: aDictionary [

	^ self evaluate
]

{ #category : #arithmetic }
EExpression >> negated [

	^ ENegation new expression: self
]
