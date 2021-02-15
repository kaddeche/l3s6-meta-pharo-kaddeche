Class {
	#name : #CHMethodScope,
	#superclass : #Object,
	#instVars : [
		'receiver',
		'variables'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHMethodScope >> receiver [ [
	^ receiver
]
]

{ #category : #accessing }
CHMethodScope >> receiver: aCHInterpretable [ [
	receiver := aCHInterpretable
]
]
