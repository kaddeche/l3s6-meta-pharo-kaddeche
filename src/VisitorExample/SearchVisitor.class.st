"
SearchVisitor
"
Class {
	#name : #SearchVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'token'
	],
	#category : #VisitorExample
}

{ #category : #accessing }
SearchVisitor >> token: aToken [ [
	token := aToken
	]
]
