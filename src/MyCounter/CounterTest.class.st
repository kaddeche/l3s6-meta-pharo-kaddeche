"
This class contains tests for the Counter class
"
Class {
	#name : #CounterTest,
	#superclass : #TestCase,
	#instVars : [
		'count'
	],
	#category : #MyCounter
}

{ #category : #tests }
CounterTest >> testCounterIsSetAndRead [

| c |
c := Counter new.
c count: 7.
self assert: c count equals: 7
]

{ #category : #tests }
CounterTest >> testDecrement [
| c |
c := Counter new.
c count: 3; decrement; decrement.
self assert: c count equals:  1
]

{ #category : #tests }
CounterTest >> testIncrement [
| c |
c := Counter new.
c count: 0; increment; increment.
self assert: c count equals:  2
]

{ #category : #tests }
CounterTest >> testValueCreationTimeIsZero [
	self assert: Counter new count  = 0
]
