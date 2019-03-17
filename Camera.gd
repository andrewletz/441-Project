extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_tree().call_group("PassCamera", "set_camera", self)
		
func _process(delta):
	pass