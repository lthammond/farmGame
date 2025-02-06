class_name PlayerIdle extends PlayerState

var regex = RegEx.new()
var regex_pattern: String = "use"


func enter(_input):
	DebugLog.log("Entered Idle State")
	regex.compile("^%s.*" % regex_pattern)
	
	player.animation_player.stop()
	player.animation_player.play("idle" + player.get_direction_from_velocity(player.last_facing_direction))
	
	
func physics_update(_delta: float):
	var direction = Input.get_vector("left", "right", "up", "down")
	if direction != Vector2.ZERO:
		transitioned.emit(self, "walk")

	# Checks if any "use" action input is used and figured out which direction to use based on which
	for action in InputMap.get_actions():
		if regex.search(action):  # Check if the action name matches the pattern assigned at top
			if Input.is_action_just_pressed(action):
				# If the action is pressed, transition to 'till' and pass the action name minus pattern
				transitioned.emit(self, "till", action.substr(regex_pattern.length(), action.length()))
