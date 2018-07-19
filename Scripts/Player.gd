extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var SPEED = 50

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("Player")
	pass
	
func set_animation (anim):
	if $AnimationPlayer.get_current_animation() != anim:
		$AnimationPlayer.play(anim)
	
func play():
	if not $AnimationPlayer.is_playing():
		$AnimationPlayer.play()

func stop():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop()

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	var direction = Vector2(0,0)
	if Input.is_action_pressed("ui_up"):
		set_animation("walking_up")
		direction.y = -1 * abs(scale.y)
	elif Input.is_action_pressed("ui_down"):
		set_animation("walking_down")
		direction.y = 1 * abs(scale.y)
	elif Input.is_action_pressed("ui_left"):
		set_animation("walking_left")
		direction.x = -1 * abs(scale.x)
	elif Input.is_action_pressed("ui_right"):
		set_animation("walking_right")
		direction.x = 1 * abs(scale.x)
	else:
		stop()
	move_and_slide(direction * SPEED)
	pass
