class_name NodeManager extends Node

@export var method_processor: MethodProcessor

var world_viewport_container_arr: Array[WorldViewportContainer] = []
var dungeon_generator_arr: Array[DungeonGenerator] = []
var dungeon_elevator_arr: Array[DungeonElevator] = []
var local_player_arr: Array[LocalPlayer] = []
var entity_body_arr: Array[EntityBody] = []
var yot_arr: Array[Yot] = []





func process_new_child(child: Node) -> void:
	child.child_entered_tree.connect(func(node: Node): process_new_child(node))
	
	if child is Processor:
		child.method_processor = method_processor
		child.node_manager = self
	
	if child is WorldViewportContainer:
		add_to_array(child, world_viewport_container_arr)
	
	if child is DungeonGenerator:
		add_to_array(child, dungeon_generator_arr)
	
	if child is DungeonElevator:
		add_to_array(child, dungeon_elevator_arr)
	
	if child is EntityBody:
		add_to_array(child, entity_body_arr)
	
	if child is LocalPlayer:
		add_to_array(child, local_player_arr)
	
	if child is Yot:
		add_to_array(child, yot_arr)





func add_to_array(node: Node, array_ref: Array) -> void:
	node.tree_exiting.connect(func(): array_ref.erase(node))
	array_ref.push_back(node)
