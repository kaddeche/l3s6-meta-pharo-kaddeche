"
Scissors is a simple abstract class which allows to play the game stone paper scissors.
Its API is
- playAgainstPaper, playAgainstScissors, playAgainstStone
- play
"
Class {
	#name : #Scissors,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #operation }
Scissors >> play: anotherTool [ 
	^ anotherTool playAgainstScissors: self 
]

{ #category : #operation }
Scissors >> playAgainstPaper: aPaper [ 
	^ #scissors 
]

{ #category : #operation }
Scissors >> playAgainstScissors: aScissors [ 
	^ #draw 
]

{ #category : #operation }
Scissors >> playAgainstStone: aStone [
	^#stone
]
