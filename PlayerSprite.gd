extends Sprite3D

export var anim_col = 0
export var anim_row = 0
export var mouse_has_control = true

var camera = null
func set_camera(c):
	camera = c

func set_flip(b):
	if (mouse_has_control):
		flip_h = b

func _process(delta):
	if camera == null:
		return
	
	var mousepos = get_viewport().get_mouse_position()
	var size = get_viewport().size

	var row = 0
	set_flip(false)
	if (mousepos.x < (size.x / 2)):
		set_flip(true)
	
	frame = anim_col + anim_row * 4