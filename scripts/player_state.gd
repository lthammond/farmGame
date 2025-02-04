class_name PlayerState extends State

# Any variables that many player states share can go in here
@export var speed = 125.0
@export var acceleration = 1000.0
@export var deceleration = 1000.0

var animation_tree: AnimationTree
var animation_state_machine: AnimationNodeStateMachinePlayback
var player: PlayerController


@export var current_tool: DataTypes.Tools = DataTypes.Tools.NONE


func _init(player_controller: PlayerController) -> void:
	player = player_controller
	animation_tree = player.animation_tree
	animation_state_machine = animation_tree.get("parameters/playback") as AnimationNodeStateMachinePlayback
