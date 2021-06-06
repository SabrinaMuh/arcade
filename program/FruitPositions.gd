extends Node
var positions_array = []
var clone
var object_typ

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn():
	for child in get_children():
		positions_array.append(child)
		
	var spawn_index = round(rand_range(0, positions_array.size()-1))
	var spawn_node = positions_array[spawn_index]
	var object
	var randnr = round(rand_range(0, 2))
	if(randnr==0):
		object = load("res://Fruit.tscn")
		object_typ = "fruit"
	else:
		object = load("res://Garbage.tscn")
		object_typ = "garbage"
	clone = object.instance()
	add_child(clone)
	clone.global_position = spawn_node.global_position
	positions_array.remove(spawn_index)


