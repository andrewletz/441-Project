extends KinematicBody

var speed = 100
var direction = Vector3()
var gravity = -10
var velocity = Vector3()

func _ready():
	pass

func _physics_process(delta):
	var should_play = false
	var psprite = $PlayerSprite
	
	direction = Vector3(0, 0, 0)
	if Input.is_action_pressed("ui_left"):
		should_play = true
		psprite.mouse_has_control = false
		psprite.anim_row = 2
		psprite.flip_h = true
		
		direction.x -= 1
		
	if Input.is_action_pressed("ui_right"):
		should_play = true
		psprite.mouse_has_control = false
		psprite.anim_row = 2
		psprite.flip_h = false
		
		direction.x += 1
		
	if Input.is_action_pressed("ui_up"):
		should_play = true
		psprite.mouse_has_control = false
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			psprite.anim_row = 3
		else:
			psprite.anim_row = 4
		
		direction.z -= 1
		
	if Input.is_action_pressed("ui_down"):
		should_play = true
		psprite.mouse_has_control = false
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			psprite.anim_row = 1
		else:
			psprite.anim_row = 0
		
		direction.z += 1
		
	direction = direction.normalized()
	direction = direction * speed * delta
	
	# animation handling
	var anim = $PlayerSprite/AnimationPlayer
	if should_play and not anim.is_playing():
		anim.play("Walk")
	
	if should_play == false and anim.is_playing():
		psprite.anim_col = 0 # set to idle sprite
		psprite.mouse_has_control = true
		anim.stop(true) # stop animation
	
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))

	#if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
	#	velocity.y = 10