class_name PlayerController extends CharacterBody2D

@export var state_machine: StateMachine
@export var animation_player: AnimationPlayer

@export var speed: float = 125.0
@export var acceleration: float = 1000.0
@export var deceleration: float = 1000.0

var last_facing_direction: Vector2
var mouse_direction: Vector2

func _ready() -> void:
	DebugLog.clear()


func _process(delta: float) -> void:
	mouse_direction = get_local_mouse_position().normalized()


	# TODO: There might be a cleaner way to do this
func get_direction_from_mouse(mouse_direction: Vector2) -> String:
	if mouse_direction.is_zero_approx():
		return "Down"

	var angle = mouse_direction.angle()

	if angle >= -PI / 4 and angle < PI / 4:
		return "Right"
	elif angle >= PI / 4 and angle < 3 * PI / 4:
		return "Down"
	elif angle >= -3 * PI / 4 and angle < -PI / 4:
		return "Up"
	else:
		return "Left"


func get_direction_from_velocity(velocity: Vector2) -> String:
	if velocity.is_zero_approx():
		return "Down"

	var dir = velocity.normalized().round()
	var directions = {
		Vector2(1, 0): "Right",
		Vector2(-1, 0): "Left",
		Vector2(0, 1): "Down",
		Vector2(0, -1): "Up",
		Vector2(1, 1): "DownRight",
		Vector2(1, -1): "UpRight",
		Vector2(-1, 1): "DownLeft",
		Vector2(-1, -1): "UpLeft",
	}

	return directions.get(dir, "Down")
