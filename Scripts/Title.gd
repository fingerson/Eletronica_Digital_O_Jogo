extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal out_mode(mode)

func _ready():
	$New_game.connect("button_down",self,"on_ng")
	$Exit.connect("button_down",self,"on_quit")
	pass

func on_ng():
	emit_signal("out_mode","ng")
	
func on_quit():
	emit_signal("out_mode","quit")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
