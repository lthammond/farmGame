extends PlayerState
class_name PlayerIdle


func enter():
	DebugLog.log("Entered Idle State")
	
func physics_update(_delta: float):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		transitioned.emit(self, "walk")

	if Input.is_action_just_pressed("use"):
		transitioned.emit(self, "till")
