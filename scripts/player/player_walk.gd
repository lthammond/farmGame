extends PlayerState
class_name PlayerWalk

@onready var player = get_parent().actor

func enter():
	DebugLog.log("Entered Walk State")

func physics_update(delta: float):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		player.velocity = player.velocity.move_toward(direction * speed, acceleration * delta)
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, deceleration * delta)
		if player.velocity == Vector2.ZERO:
			transitioned.emit(self, "idle")

	player.move_and_slide()
