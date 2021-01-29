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

{ #category : #'public access' }
ENegation >> evaluate [ 


	^ expression evaluate  negated
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

	aStream nextPutAll: '- '.
	expression printOn: aStream 
]
