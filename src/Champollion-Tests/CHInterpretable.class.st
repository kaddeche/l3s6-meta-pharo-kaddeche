Class {
	#name : #CHInterpretable,
	#superclass : #Object,
	#instVars : [
		'x',
		'collaborator',
		'evaluationOrder'
	],
	#category : #'Champollion-Tests'
}

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorWithArgument [ [
	collaborator x: 500
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> changeCollaboratorX [ [
	collaborator store100IntoX
]
]

{ #category : #accessing }
CHInterpretable >> collaborator [ [
	^ collaborator
]
]

{ #category : #accessing }
CHInterpretable >> collaborator: anObject [ [
	collaborator := anObject
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> endMessageReturnX [ [
	^ self returnX
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> etXAndMessage [ [
	x := 1000.
	collaborator returnX.
	^ x
]
]

{ #category : #accessing }
CHInterpretable >> evaluateReceiver [ [
	evaluationOrder := self next.
	^ self
]
]

{ #category : #accessing }
CHInterpretable >> evaluationOrder [ [
	^ evaluationOrder
	]
]

{ #category : #initialization }
CHInterpretable >> initialize [ [
	super initialize.
	current := { "empty" }.
]
]

{ #category : #accessing }
CHInterpretable >> messageArg1: arg1 arg2: arg2 arg3: arg3 [ [
	^ {arg1 . arg2 . arg3}
]
]

{ #category : #accessing }
CHInterpretable >> next [ [
	| result |
	"Implement a stream as an increment in terms of Peano axioms.See 	https://en.wikipedia.org/wiki/Peano_axioms"
	result := current.
	"We increment the counter"current := { current }.
	"We return the previous result"
	^ result
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnBoolean [ [
	^ false
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnEmptyLiteralArray [ [
	^ #()
]
]

{ #category : #accessing }
CHInterpretable >> returnEvaluationOrder [ [
	^ self evaluateReceiver
		messageArg1: self next
		arg2: self next
		arg3: self next
	]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnFloat [ [
	^ 3.14
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnInteger [ [ 

	^ 5
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnRecursiveLiteralArray [ [
	^ #(true 1 #('ahah'))
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSelf [ [
	^ self
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnSuper [ [
	^ super
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnUnassignedTemp [ [
	| temp |
	^ temp
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> returnX [ [
	^ x
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> store100IntoX [ [
	^ x := 100
]
]

{ #category : #visiting }
CHInterpretable >> visitSelfNode: aNode [ [
	^ self receiver
]
]

{ #category : #writing }
CHInterpretable >> writeTemporaryVariable [ [
	| temp |
	temp := 100.
	^ temp
]
]

{ #category : #accessing }
CHInterpretable >> x [ [
	^ x
]
]

{ #category : #'as yet unclassified' }
CHInterpretable >> x: anInteger [ [
	x := anInteger
]
]
