extends Node
class_name StateMachine

@export var initial_state: State
@export var actor: Node

var current_state: State
var states: Dictionary = {}


func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.transitioned.connect(_on_child_transition)
			DebugLog.log("Registered State: {}".format([child.name.to_lower()], "{}"))
			
	if initial_state:
		initial_state.enter()
		current_state = initial_state


func _process(delta: float):
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float):
	if current_state:
		current_state.physics_update(delta)


func _on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if not new_state:
		DebugLog.log("State not found: {}".format([current_state], "{}"))
		return
		
	if current_state:
		DebugLog.log("Exiting State: {}".format([current_state], "{}"))
		current_state.exit()
		
	current_state = new_state
	DebugLog.log("Entering State: {}".format([current_state], "{}"))
	current_state.enter()
