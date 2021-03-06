"
EAddition class
"
Class {
	#name : #EAddition,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'instance creation' }
EAddition class >> fivePlusThre [
	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant new value: 5.
	ep2 := EConstant new value: 3.
	^ self new left: ep1 ; right: ep2
]

{ #category : #'instance creation' }
EAddition class >> left: anInteger right: anInteger2 [

	^ self new left: anInteger ; right: anInteger2 
]

{ #category : #visiting }
EAddition >> accept: aVisitor [ 

	^ aVisitor visitAddition: self
]

{ #category : #accessing }
EAddition >> evaluate [ 

	^ right evaluate + left evaluate 
	
]

{ #category : #accessing }
EAddition >> evaluateWith: anObject [ 

	^ self accept: EEvaluatorVisitor new
]

{ #category : #accessing }
EAddition >> operatorString [

	^ ' + '
]
