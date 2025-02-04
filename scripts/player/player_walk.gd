class_name PlayerWalk extends PlayerState

static var state_name = "Walk"

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
			
	if Input.is_action_just_pressed("use"):
		transitioned.emit(self, "till")

	player.move_and_slide()


func get_state_name() -> String:
	return state_name
