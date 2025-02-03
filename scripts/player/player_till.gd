extends PlayerState
class_name PlayerTill

@export var animation_player: AnimationPlayer

func enter():
	DebugLog.log("Entered Till State")


func update(delta):
	if not animation_player.is_playing():
		transitioned.emit(self, "idle")
