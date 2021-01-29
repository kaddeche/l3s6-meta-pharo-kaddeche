"
EMultiplication class
"
Class {
	#name : #EMultiplication,
	#superclass : #EBinaryExpression,
	#category : #Expressions
}

{ #category : #'as yet unclassified' }
EMultiplication class >> fiveTimesThree [
	<sampleInstance>
	| ep1 ep2 |
	ep1 := EConstant constant5.
	ep2 := EConstant constant3.
	^ EMultiplication new left: ep1 ; right: ep2
]

{ #category : #'instance creation' }
EMultiplication class >> left: anExp right: anExp2 [

	^ self new left: anExp ; right: anExp2
]

{ #category : #'public access' }
EMultiplication >> evaluate [ 

	^ right evaluate * left evaluate 
]

{ #category : #accessing }
EMultiplication >> operatorString [

	^ ' * '
]
