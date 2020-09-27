extends KinematicBody

var speed = 600
var direction = Vector3()
var gravity = -9.8
var velocity = Vector3()

func _physics_process(delta):
	direction = Vector3(0, 0, 0)
			
	if Input.is_action_pressed("ui_left"):
		direction.x += 1
	if Input.is_action_pressed("ui_right"):
		direction.x -= 1
	if Input.is_action_pressed("ui_up"):
		direction.z += 1
	if Input.is_action_pressed("ui_down"):
		direction.z -= 1
		
	direction = direction.normalized()
	direction = direction * speed * delta
	velocity.y += gravity * delta
	velocity.x = direction.x
	velocity.z = direction.z
	velocity = move_and_slide(velocity, Vector3(0, 1, 0))
	
	if Input.is_key_pressed(KEY_CONTROL):
		rotate_y(deg2rad(90)) #deg is degrees
		
	if Input.is_key_pressed(KEY_1):
		if $Camera.is_current():
			$Camera.clear_current(true)
			$Camera2.make_current()
		elif $Camera3.is_current():
			$Camera3.clear_current(true)
			$Camera2.make_current()
		elif $Camera4.is_current():
			$Camera4.clear_current(true)
			$Camera2.make_current()
		elif $Camera5.is_current():
			$Camera5.clear_current(true)
			$Camera2.make_current()
	elif Input.is_key_pressed(KEY_2):
		if $Camera.is_current():
			$Camera.clear_current(true)
			$Camera3.make_current()
		elif $Camera2.is_current():
			$Camera2.clear_current(true)
			$Camera3.make_current()
		elif $Camera4.is_current():
			$Camera4.clear_current(true)
			$Camera3.make_current()
		elif $Camera5.is_current():
			$Camera5.clear_current(true)
			$Camera3.make_current()
	elif Input.is_key_pressed(KEY_3):
		if $Camera2.is_current():
			$Camera2.clear_current(true)
			$Camera.make_current()
		elif $Camera3.is_current():
			$Camera3.clear_current(true)
			$Camera.make_current()
		elif $Camera4.is_current():
			$Camera4.clear_current(true)
			$Camera.make_current()
		elif $Camera5.is_current():
			$Camera5.clear_current(true)
			$Camera.make_current()
	elif Input.is_key_pressed(KEY_4):
		if $Camera.is_current():
			$Camera.clear_current(true)
			$Camera4.make_current()
		elif $Camera2.is_current():
			$Camera2.clear_current(true)
			$Camera4.make_current()
		elif $Camera3.is_current():
			$Camera3.clear_current(true)
			$Camera4.make_current()
		elif $Camera5.is_current():
			$Camera5.clear_current(true)
			$Camera4.make_current()
	elif Input.is_key_pressed(KEY_5):
		if $Camera.is_current():
			$Camera.clear_current(true)
			$Camera5.make_current()
		elif $Camera2.is_current():
			$Camera2.clear_current(true)
			$Camera5.make_current()
		elif $Camera3.is_current():
			$Camera3.clear_current(true)
			$Camera5.make_current()
		elif $Camera4.is_current():
			$Camera4.clear_current(true)
			$Camera5.make_current()
	
	if velocity.y > 0:
		gravity = -20
	else:
		gravity = -30
	
	if is_on_floor() and Input.is_key_pressed(KEY_SPACE):
		velocity.y = 1
