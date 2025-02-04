class_name PlayerController extends CharacterBody2D

@export var state_machine: StateMachine

@onready var animation_tree: AnimationTree = $AnimationTree

func _ready() -> void:
	var states: Array[State] = [PlayerIdle.new(self), PlayerWalk.new(self), PlayerTill.new(self)]
	state_machine.start_machine(states)
