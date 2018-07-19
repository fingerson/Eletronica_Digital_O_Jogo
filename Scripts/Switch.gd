extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal out(val)

var player_in = false
var status

export(String) var letra = 'w'

var dict = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e':4, 'w': 5, 'x': 6, 'y': 7, 'z': 8}


func _ready():
	status = false
	$Switch.frame = 0
	$Bolt.frame = 1
	$Active_Area.connect("body_entered",self,"_on_body_enter")
	$Active_Area.connect("body_exited",self,"_on_body_exit")
	pass

func _on_body_enter(body):
	if body.is_in_group("Player"):
		player_in = true
		
func _on_body_exit(body):
	if body.is_in_group("Player"):
		player_in = false

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	$letters.frame = dict[letra]
	if player_in:
		if Input.is_action_just_pressed("ui_accept"):
			if status == false:
				status = true
				$Switch.frame = 1
				$Bolt.frame = 0
				emit_signal("out", true)
			else:
				status = false
				$Switch.frame = 0
				$Bolt.frame = 1
				emit_signal("out",false)
			
	
	pass
