extends Node
class_name FieldCursorComponent

@export var grass_tilemap_layer: TileMapLayer
@export var tilled_soil_tilemap_layer: TileMapLayer
@export var terrain_set: int = 0
@export var terrain: int = 1

@onready var player: PlayerController = $"../Player"

var mouse_position: Vector2
var cell_position: Vector2i
var cell_source_id: int
var local_cell_position: Vector2
var distance: float

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		#TODO: check tool at some point
		get_cell_under_mouse()
		add_tilled_soil_cell()
		
func get_cell_under_mouse() -> void:
	mouse_position = grass_tilemap_layer.get_local_mouse_position()
	cell_position = grass_tilemap_layer.local_to_map(mouse_position)
	cell_source_id = grass_tilemap_layer.get_cell_source_id(cell_position)
	local_cell_position = grass_tilemap_layer.map_to_local(cell_position)
	distance = player.global_position.distance_to(local_cell_position)
	
func add_tilled_soil_cell() -> void:
	if distance < 30.0 && cell_source_id != -1:
		if tilled_soil_tilemap_layer.get_cell_atlas_coords(cell_position) == Vector2i(-1, -1):
			print("changing %s cell to terrain set %s and terrain %s" % [cell_position, terrain_set, terrain])
			tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_position], terrain_set, terrain, false)
