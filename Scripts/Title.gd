extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal out_mode(mode)

func _ready():
	$New_game.connect("button_down",self,"_on_ng")
	$Exit.connect("button_down",self,"_on_quit")
	pass

func _on_ng():
	emit_signal("out_mode","ng")
	
func _on_quit():
	emit_signal("out_mode","quit")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
