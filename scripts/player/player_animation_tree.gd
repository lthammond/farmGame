extends Node

@export var animation_tree: AnimationTree
@export var animation_player: AnimationPlayer
@onready var player : CharacterBody2D = get_parent()

var last_facing_direction := Vector2.ZERO

func _physics_process(delta: float):
	var idle = !player.velocity
	
	if !idle:
		last_facing_direction = player.velocity.normalized()
	
	if Input.is_action_just_pressed("use"):
		var tilling = true
		animation_tree.set("parameters/Till/blend_position", last_facing_direction)
		
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)
