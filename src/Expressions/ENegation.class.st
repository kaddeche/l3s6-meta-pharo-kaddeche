"
ENegation class
"
Class {
	#name : #ENegation,
	#superclass : #EExpression,
	#instVars : [
		'expression'
	],
	#category : #Expressions
}

{ #category : #accessing }
ENegation class >> expression: anExpression [ 

	^ self new expression: anExpression 
]

{ #category : #visiting }
ENegation >> accept: aVisitor [ 

	^ aVisitor visitNegation: self 
]

{ #category : #'public access' }
ENegation >> evaluate [ 


	^ expression evaluate  negated
]

{ #category : #accessing }
ENegation >> evaluateWith: anObject [ 

	^ self accept: EEvaluatorVisitor new
]

{ #category : #visiting }
ENegation >> expression [ 
	^ expression
]

{ #category : #accessing }
ENegation >> expression: anExpression [

	expression := anExpression 
]

{ #category : #arithmetic }
ENegation >> negated [ 

	^ expression
	
]

{ #category : #printing }
ENegation >> printOn: aStream [

	aStream nextPutAll: '-'.
	expression printOn: aStream 
]
