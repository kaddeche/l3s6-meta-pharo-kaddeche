Class {
	#name : #EEvaluatorVisitorTest,
	#superclass : #TestCase,
	#category : #'Expressions-Test'
}

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitAdditionReturnsAdditionResult [

	| expression result |
	expression := EAddition 
		left: (EConstant value: 7)
		right: (EConstant value: 2).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals: 9
]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitConstantReturnsConstantValue [

	| constant result |
	constant := EConstant value: 5.
	result := constant accept: EEvaluatorVisitor new.
	self assert: result equals: 5
]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitDivisionByZeroThrowsException [

	| expression |
	expression := EDivision 
		numerator: (EConstant value: 6)
		denominator: (EConstant value: 0).
	self 
		should: [ expression accept: EEvaluatorVisitor new ]
		raise: EZeroDenominator
]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitDivisionReturnsDivisionResult [

	| expression result |
	expression := EDivision
		numerator: (EConstant value: 6)
		denominator: (EConstant value: 3).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals: 2
]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitMultiplicationReturnsMultiplicationResult [

	| expression result |
	expression := EMultiplication 
		left: (EConstant value: 7)
		right: (EConstant value: -2).
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals: -14
]

{ #category : #tests }
EEvaluatorVisitorTest >> testVisitNegationReturnsNegatedConstant [

	| expression result|
	expression := (EConstant value: 7) negated.
	result := expression accept: EEvaluatorVisitor new.
	self assert: result equals: -7
]
