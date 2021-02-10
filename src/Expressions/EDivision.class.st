Class {
	#name : #EDivision,
	#superclass : #EBinaryExpression,
	#instVars : [
		'numerator',
		'denominator'
	],
	#category : #Expressions
}

{ #category : #'instance creation' }
EDivision class >> numerator: aNumeratorExpression denominator: aDenominatorExpression [

	^ self new 
		numerator: aNumeratorExpression 
		denominator: aDenominatorExpression 
		yourself 
]

{ #category : #visiting }
EDivision >> accept: aVisitor [ 

	^ aVisitor visitDivision: self 
]

{ #category : #accessing }
EDivision >> denominator [ 

	^ denominator 
]

{ #category : #accessing }
EDivision >> numerator [ 

	^ numerator 
]

{ #category : #accessing }
EDivision >> operatorString [

	^ ' / '
]
