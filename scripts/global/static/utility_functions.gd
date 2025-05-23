class_name UtilityFunctions

## UtilityFunctions class:
## a class containing static functions for global use.

## Recursively gets all child nodes of a given root_node.
## Stops recursion at nodes of type stop_class (if provided).
static func get_all_Children(root_node, stop_class = null) -> Array[Node]: 
	var nodes: Array[Node] = []
	for node in root_node.get_children():
		nodes.append(node)
		if node.get_child_count() > 0 and node != stop_class:
			nodes += get_all_Children(node, stop_class)
	return nodes

## detects if position is in map (for error handeling)
static func in_map(cell: Vector2): 
	return WorldPathfinder.map.local_to_map(cell) in WorldPathfinder.map.get_used_cells()


static func find_last_occurrence(array: Array, cls: Script) -> Object:
	for i in range(array.size() - 1, -1, -1):
		if is_instance_of(array[i], cls):
			return array[i]
	return null
