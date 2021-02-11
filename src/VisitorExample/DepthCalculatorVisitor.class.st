"
DepthCalculatorVisitor
"
Class {
	#name : #DepthCalculatorVisitor,
	#superclass : #Object,
	#category : #VisitorExample
}

{ #category : #visiting }
DepthCalculatorVisitor >> visitLeafNode: aSelfNode [ [
	^ 1
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitLiteralValueNode: aRBLiteralValueNode [ [
	^ self visitNode: aRBLiteralValueNode
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitMessageNode: aRBMessageNode [ [
	^ self visitNode: aRBMessageNode
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitMethodNode: aRBMethodNode [ [
	^ self visitNode: aRBMethodNode
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitNode: aNode [ [
	^ 1 + (aNode children
		inject: 0
		into: [ :max :node | max max: (node acceptVisitor: self) ])
	]
]

{ #category : #'accessing - subwidgets' }
DepthCalculatorVisitor >> visitNodeWithChildren: aNode [ [
	^ 1 + (aNode children
		inject: 0
		into: [ :max :node | max max: (node acceptVisitor: self) ])
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitSelfNode: aSelfNode [ [
	^ self visitNode: aSelfNode
	]
]

{ #category : #visiting }
DepthCalculatorVisitor >> visitSequenceNode: aRBSequenceNode [ [
	^ self visitNode: aRBSequenceNode
	]
]
