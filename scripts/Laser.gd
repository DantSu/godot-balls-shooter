extends Area2D

var time = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(get_position() + Vector2.UP.rotated(get_rotation()) * delta * 1000)
	
	time -= delta
	if time < 0:
		destroy()

func destroy():
	hide()
	queue_free()

func update(ball):
	destroy()
	ball.life -= 1
