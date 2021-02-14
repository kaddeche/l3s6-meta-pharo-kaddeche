"
Stone is a simple abstract class which allows to play the game stone paper scissors.
Its API is
- playAgainstPaper, playAgainstScissors, playAgainstStone
- play
"
Class {
	#name : #Stone,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #operation }
Stone >> play: anotherTool [ 
	^ anotherTool playAgainstStone: self
]

{ #category : #operation }
Stone >> playAgainstPaper: aPaper [ 
	^ #paper
]

{ #category : #operation }
Stone >> playAgainstScissors: aScissors [ 
	^ #stone
]

{ #category : #operation }
Stone >> playAgainstStone: aStone [
	^ #draw 
]
