class_name PlayerIdle extends PlayerState

static var state_name = "Idle"

func enter():
	DebugLog.log("Entered Idle State")
	
func physics_update(_delta: float):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		transitioned.emit(self, "walk")

	if Input.is_action_just_pressed("use"):
		transitioned.emit(self, "till")


func get_state_name() -> String:
	return state_name
