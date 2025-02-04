extends Node

@onready var animation_tree: AnimationTree = $"../AnimationTree"
@onready var player : PlayerController = get_parent()
@onready var animation_state_machine := animation_tree.get("parameters/playback") as AnimationNodeStateMachinePlayback

var last_facing_direction := Vector2.ZERO

func _physics_process(delta: float):
	var current_state = player.state_machine.current_state.get_state_name()
	if current_state != "idle":
		last_facing_direction = player.velocity.normalized()
	
	if Input.is_action_just_pressed("use"):
		animation_tree.set("parameters/Till/blend_position", last_facing_direction)
	animation_tree.set("parameters/Walk/blend_position", last_facing_direction)
	animation_tree.set("parameters/Idle/blend_position", last_facing_direction)

func _process(_delta: float):
	print(animation_state_machine.get_current_node())
