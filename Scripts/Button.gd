extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal end

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	connect("body_entered",self,"_on_body_enter")
	connect("body_exited",self,"_on_body_exit")
	pass

func _on_body_exit(body):
	if body.is_in_group("Player"):
		$Sprite.frame = 0

func _on_body_enter(body):
	if body.is_in_group("Player"):
		$Sprite.frame = 1
		emit_signal("end")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
