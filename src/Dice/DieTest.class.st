Class {
	#name : #DieTest,
	#superclass : #TestCase,
	#category : #Dice
}

{ #category : #tests }
DieTest >> testAddTwoDice [

	| hd |
	hd := (Die withFaces: 6) + (Die withFaces: 6).
	self assert: hd dice size = 2.
]

{ #category : #tests }
DieTest >> testAddingADieAndHandle [

	| hd |
	hd := (Die withFaces: 6)
		+
		(DieHandle new 
			addDie: 6;
			yourself ).
	self assert: hd dice size equals: 2
]

{ #category : #tests }
DieTest >> testCreationIsOk [

	| d |
	d := Die withFaces: 20.
	self assert: d faces equals: 20
	
]

{ #category : #tests }
DieTest >> testInitalizationIsOk [
	| d |
	d := Die new.
	self assert: d faces equals: 6
]

{ #category : #tests }
DieTest >> testRolling [

	| d |
	d := Die new.
	10 timesRepeat: 
		[ self assert: (d roll between: 1 and: 6 ) ]
]
