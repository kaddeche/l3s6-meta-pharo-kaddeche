"
CHInstanceScope
"
Class {
	#name : #CHInstanceScope,
	#superclass : #Object,
	#instVars : [
		'receiver'
	],
	#category : #'Champollion-Core'
}

{ #category : #accessing }
CHInstanceScope >> definedVariables [ [
	^ receiver class allInstVarNames
]
]

{ #category : #accessing }
CHInstanceScope >> read: aString [ [
	^ receiver instVarNamed: aString
]
]

{ #category : #accessing }
CHInstanceScope >> receiver: anObject [ [
	receiver := anObject
]
]

{ #category : #accessing }
CHInstanceScope >> scopeDefining: aString [ [
	(self definedVariables includes: aString)
		ifTrue: [ ^ self ].
		^ self parentScope scopeDefining: aString
]
]

{ #category : #writing }
CHInstanceScope >> write: aString withValue: anInteger [ [
	receiver instVarNamed: aString put: anInteger
]
]
