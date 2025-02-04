class_name PlayerTill extends PlayerState

static var state_name = "Till"

func enter():
	DebugLog.log("Entered Till State")
	player.tilling = true


func update(delta):
	var animation_length = animation_state_machine.get_current_length()
	var animation_progress = animation_state_machine.get_current_play_position()
	if animation_progress == animation_length:
		transitioned.emit(self, "idle")
		player.tilling = false


func get_state_name() -> String:
	return state_name
