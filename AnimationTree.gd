extends AnimationTree

var playback : AnimationNodeStateMachinePlayback

func _ready():
	playback = get("parameters/playback")
	playback.start("Idle")
	active = true

func _process(delta):
	var is_moving = false
	if Input.is_key_pressed(KEY_SPACE):
		is_moving = true
		playback.travel("Jump")
	if Input.is_action_pressed("ui_up"):
		is_moving = true
		playback.travel("Walk")
	if Input.is_action_pressed("ui_down"):
		is_moving = true
		playback.travel("Walk")
	if Input.is_action_pressed("ui_left"):
		is_moving = true
		playback.travel("Walk")
	if Input.is_action_pressed("ui_right"):
		is_moving = true
		playback.travel("Walk")
	if is_moving != true:
		playback.travel("Idle")
