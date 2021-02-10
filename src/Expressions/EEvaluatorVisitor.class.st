"
Class representing the evaluating visitor
"
Class {
	#name : #EEvaluatorVisitor,
	#superclass : #Object,
	#instVars : [
		'left',
		'right'
	],
	#category : #'Expressions-Model'
}

{ #category : #accessing }
EEvaluatorVisitor >> left [ 

	^ left
]

{ #category : #accessing }
EEvaluatorVisitor >> right [ 

	^ right
]

{ #category : #visiting }
EEvaluatorVisitor >> visitAddition: anEAddition [ 

	| evaluationOfLeft evaluationOfRight |
	evaluationOfLeft := anEAddition left accept: self.
	evaluationOfRight := anEAddition right accept: self.
	^ evaluationOfLeft + evaluationOfRight
]

{ #category : #visiting }
EEvaluatorVisitor >> visitConstant: aConstant [

	^ aConstant value 
]

{ #category : #visiting }
EEvaluatorVisitor >> visitDivision: aDivision [

	| denom numerator |
	denom := aDivision denominator accept: self.
	denom isZero 
		ifTrue: [ EZeroDenominator signal ].
	numerator := aDivision numerator accept: self.
	^ numerator / denom
]

{ #category : #visiting }
EEvaluatorVisitor >> visitMultiplication: anEMultiplication [

	| evaluationOfLeft evaluationOfRight|
	evaluationOfLeft := anEMultiplication  left accept: self.
	evaluationOfRight := anEMultiplication right accept: self.
	^ evaluationOfLeft * evaluationOfRight 
]

{ #category : #visiting }
EEvaluatorVisitor >> visitNegation: anENegation [

	|aNumber|
	aNumber := anENegation expression accept: self.
	^ aNumber negated
]
