class_name PlayerState extends State

var player: PlayerController
var animation_player: AnimationPlayer

# Stats like speed can be placed in PlayerController instead
# Removing them from here to simplify

func initialize(player_controller: PlayerController) -> void:
	player = player_controller

# This method is for any state-specific behavior, like animations
func enter(_input) -> void:
	DebugLog.log("Entered State: %s" % name)

# Optionally add other state-specific methods
func exit() -> void:
	DebugLog.log("Exiting State: %s" % name)

func update(delta: float) -> void:
	# Update logic for state
	pass

func physics_update(delta: float) -> void:
	# Physics-specific logic for state
	pass
