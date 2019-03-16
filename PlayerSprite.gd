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
	
	set_flip(false)
	if mouse_has_control: # only move sprite if we should be
		# get the sprite's location in device space
		var sprite_loc = camera.unproject_position(get_global_transform().origin)
		# get vector of relative position between sprite and mouse
		var relativepos = Vector2(mousepos.x - sprite_loc.x, mousepos.y - sprite_loc.y)
		var rads = atan2(relativepos.y, relativepos.x)
		var ang = rad2deg(rads) # get angle that sprite should be facing
		if ang < 0:
			ang += 360
		
		# find sprite direction based on angle
		if ang < 30 or ang > 330:
			anim_row = 2 # right
		elif ang < 60:
			anim_row = 1 # down right
		elif ang < 120:
			anim_row = 0 # down
		elif ang < 150:
			anim_row = 1 # down left
		elif ang < 180:
			anim_row = 2 # left
		elif ang < 210:
			anim_row = 3 # up left
		elif ang < 270:
			anim_row = 4 # up
		elif ang < 330:
			anim_row = 3 # up right
		
		if ang > 90 and ang < 270:
			set_flip(true)
	
	frame = anim_col + anim_row * 4
