"
Counter is simple concrete class which supports incrementing and decrementing a counter.
Its API is 
- decrement, increment
- count
Its creation API is message withValue:
"
Class {
	#name : #Counter,
	#superclass : #Object,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #accessing }
Counter >> count [
	"return the current value of the value instance variable"	
			
	^ count
]

{ #category : #setter }
Counter >> count: anInteger [ 
	count := anInteger
	
	
	
	
	 
	
]

{ #category : #operation }
Counter >> decrement [ 

	count := count - 1
	
]

{ #category : #operation }
Counter >> increment [ 

	count := count + 1
]

{ #category : #initialization }
Counter >> initialize [ 
	"set the initial value of the value to 0"
	self count: 0
]

{ #category : #printing }
Counter >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' with value: ', count printString.
	aStream cr
]

{ #category : #printing }
Counter >> withValue: anInteger [ 
	| c |
	c := self new count: anInteger.
	^ c
]
