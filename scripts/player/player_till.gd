class_name PlayerTill extends PlayerState


func enter(direction: String = ""):
	DebugLog.log("Entered Till State")
	player.velocity = Vector2.ZERO
	
	if direction == "":
		player.animation_player.play("till" + player.get_direction_from_mouse(player.mouse_direction))
	else:
		player.animation_player.play("till" + direction.capitalize())

	player.animation_player.animation_finished.connect(_on_animation_finished)


func _on_animation_finished(animation_name: String) -> void:
	transitioned.emit(self, "idle")
	player.animation_player.animation_finished.disconnect(_on_animation_finished)
