"
DieHandle class
"
Class {
	#name : #DieHandle,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #Dice
}

{ #category : #arithmetic }
DieHandle >> + aDieHandle [
	
	| handle |
	handle := DieHandle new.
	self dice do: [  :each | handle addDie: each  ].
	aDieHandle  dice do: [ :each | handle addDie: each ].
	^ handle 
]

{ #category : #adding }
DieHandle >> addDie: aDie [
	dice add: aDie
]

{ #category : #adding }
DieHandle >> dice [ 
	^ dice
]

{ #category : #adding }
DieHandle >> diceNumber [
	^ dice size 
]

{ #category : #initialization }
DieHandle >> initialize [ 

	super initialize.
	dice := OrderedCollection new.
]

{ #category : #accessing }
DieHandle >> maxValue [	
	| res |
	res := 0.
	dice do: [  :each | res := res + each faces  ].
	^ res
]

{ #category : #accessing }
DieHandle >> roll [ 	
	| res |
	res := 0.
	dice do: [  :each | res := res + each roll ].
	^ res
]