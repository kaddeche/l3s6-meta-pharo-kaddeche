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
CHMethodScope >> read: aString [ [
	^ variables at: aString
]
]

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

{ #category : #accessing }
CHMethodScope >> scopeDefining: aString [ [
	(variables includesKey: aString)
		ifTrue: [ ^ self ].
		^ self parentScope scopeDefining: aString
]
]

{ #category : #writing }
CHMethodScope >> write: aString withValue: aValue [ [
	variables at: aString put: aValue
]
]
