"
Die class

Its API is
- faces, roll,
"
Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'faces'
	],
	#category : #Dice
}

{ #category : #'instance creation' }
Die class >> withFaces: aNumber [
	^ self new faces: aNumber; yourself
]

{ #category : #arithmetic }
Die >> + aDie [

	^  DieHandle new 
		addDie: self;
		addDie: aDie; yourself 
]

{ #category : #accessing }
Die >> faces [ 
	^ faces
]

{ #category : #accessing }
Die >> faces: aNumber [
	faces := aNumber
]

{ #category : #initialization }
Die >> initialize [ 
	super initialize.
	faces := 6
]

{ #category : #printing }
Die >> printOn: aStream [
	"a Die (faces number)"
	
	super printOn: aStream.
	aStream nextPutAll: '(', faces printString, ')'
]

{ #category : #accessing }
Die >> roll [ 
	^ faces atRandom 
]

{ #category : #arithmetic }
Die >> sumWithDie: aDie [ 

	^  DieHandle new 
		addDie: self;
		addDie: aDie; yourself 
]
