"
Paper is a simple abstract class which allows to play the game stone paper scissors.
Its API is
- playAgainstPaper, playAgainstScissors, playAgainstStone
- play
"
Class {
	#name : #Paper,
	#superclass : #Object,
	#category : #StonePaperScissors
}

{ #category : #operation }
Paper >> play: anotherTool [
	^ anotherTool playAgainstPaper: self
]

{ #category : #operation }
Paper >> playAgainstPaper: aPaper [
	^ #draw 
]

{ #category : #operation }
Paper >> playAgainstScissors: aScissors [
	^ #scissors
]

{ #category : #operation }
Paper >> playAgainstStone: aStone [
	^ #paper
]
