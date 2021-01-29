Class {
	#name : #EVariable,
	#superclass : #EExpression,
	#instVars : [
		'id'
	],
	#category : #Expressions
}

{ #category : #accessing }
EVariable >> evaluateWith: aBindingDictonary [

	^ aBindingDictonary at: id
]

{ #category : #accessing }
EVariable >> id: aSymbol [ 

	id := aSymbol 
]

{ #category : #printing }
EVariable >> printOn: aStream [

	aStream nextPutAll: id asString 
]