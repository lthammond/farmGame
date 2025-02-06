class_name PlayerWalk extends PlayerState

var regex = RegEx.new()
var regex_pattern: String = "use"


func enter(_input):
	DebugLog.log("Entered Walk State")
	regex.compile("^%s.*" % regex_pattern)


func physics_update(delta: float):
	var direction = Input.get_vector("left", "right", "up", "down")
	
	if direction != Vector2.ZERO:
		player.velocity = player.velocity.move_toward(direction * player.speed, player.acceleration * delta)
		player.last_facing_direction = player.velocity
		player.animation_player.play("walk" + player.get_direction_from_velocity(player.velocity))
	else:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, player.deceleration * delta)
		if player.velocity == Vector2.ZERO:
			transitioned.emit(self, "idle")
	
	# Checks if any "use" action input is used and figured out which direction to use based on which
	for action in InputMap.get_actions():
		if regex.search(action):  # Check if the action name matches the pattern assigned at top
			if Input.is_action_just_pressed(action):
				# If the action is pressed, transition to 'till' and pass the action name minus pattern
				transitioned.emit(self, "till", action.substr(regex_pattern.length(), action.length()))

	player.move_and_slide()
