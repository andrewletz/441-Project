extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	#var rotatables = get_tree().get_nodes_in_group("rotatable")
	#for node in rotatables:
	#	print("nice")
	get_tree().call_group("PassCamera", "set_camera", self)
		
func _process(delta):
	pass