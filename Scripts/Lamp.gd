extends StaticBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var status = false

export(String) var letra = 'a'

var dict = {'a': 0, 'b': 1, 'c': 2, 'd': 3, 'e':4, 'w': 5, 'x': 6, 'y': 7, 'z': 8}

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass
	
func set(val):
	status = val

func _process(delta):
	if status == true:
		$Sprite.frame = 1
	else:
		$Sprite.frame = 0
	$letters.frame = dict[letra]
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	pass
