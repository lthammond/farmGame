extends CharacterBody2D

@export var state_machine: Node


func _ready():
	if state_machine:
		state_machine.initial_state.enter()
