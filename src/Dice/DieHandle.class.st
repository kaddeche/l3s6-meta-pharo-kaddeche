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
DieHandle >> + aDieOrADieHandle [

	^ (aDieOrADieHandle class = DieHandle )
		ifTrue: [ | handle |
				handle := self class new.
				self dice do: [ :each | handle addDie: each ].
				aDieOrADieHandle dice do: [ :each | handle addDie: each ].
				handle ]
		ifFalse: [  | handle |
				handle := self class new.
				self dice do: [ :each | handle addDie: each ].
				handle addDie: aDieOrADieHandle .
				handle ]
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
