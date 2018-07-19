extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
signal end(status)

export(bool) var A = true
export(bool) var B = false
export(bool) var C = false
export(bool) var D = false
export(bool) var E = false

var out = [false,false,false,false]
const expected_out = [false, false, false, false]


func _ready():
	$A.set(true)
	$X.connect("out", self, "_on_x_out")
	$Button.connect("end",self,"_on_button_press")
	pass
	
func _on_x_out(val):
	out[1] = val
	
func _on_button_press():
	for i in range(4):
		if out[i] != expected_out[i]:
			emit_signal("end", false)
			print("lose")
			return
	emit_signal("end", true)
	print("win")
	pass
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
