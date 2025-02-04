extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State
var states: Dictionary = {}

func start_machine(states_array: Array[State]) -> void:
	for state in states_array:
		print(state.get_state_name().to_lower())
		states[state.get_state_name().to_lower()] = state
		state.transitioned.connect(_on_state_transition)
		DebugLog.log("Registered State: {}".format([state.get_state_name().to_lower()], "{}"))
	current_state = states_array[0]

func _process(delta: float):
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float):
	if current_state:
		current_state.physics_update(delta)


func _on_state_transition(state: State, new_state_name: String):
	if state != current_state:
		return
		
	var new_state = states.get(new_state_name.to_lower())
	if not new_state:
		DebugLog.log("State not found: {}".format([current_state.get_state_name()], "{}"))
		return
		
	if current_state:
		print("Exiting State: {}".format([current_state.get_state_name()], "{}"))
		DebugLog.log("Exiting State: {}".format([current_state.get_state_name()], "{}"))
		current_state.exit()
		
	current_state = new_state
	DebugLog.log("Entering State: {}".format([current_state.get_state_name()], "{}"))
	print("Entering State: {}".format([current_state.get_state_name()], "{}"))
	current_state.enter()
