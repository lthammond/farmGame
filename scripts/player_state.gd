extends State
class_name PlayerState

# Any variables that many player states share can go in here
@export var speed = 125.0
@export var acceleration = 1000.0
@export var deceleration = 1000.0

@export var current_tool: DataTypes.Tools = DataTypes.Tools.NONE
