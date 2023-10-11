extends Area2D

var Laser = preload("res://prefabs/laser.tscn")
var Ball = preload("res://prefabs/ball.tscn")

@onready var node_root = get_node("/root/World")
@onready var node_label_life = get_node("/root/World/Life")

var rd = RandomNumberGenerator.new()

var time_between_balls = 1
var time_next_ball = time_between_balls
var life = 10

func _ready():
	update_ui()
	
func _process(delta):
	time_next_ball -= delta
	if time_next_ball < 0:
		time_between_balls -= 0.001
		time_next_ball = time_between_balls
		launch_ball()

func _input(event):
	if event is InputEventMouseMotion:
		look_at(event.position)
	elif event is InputEventMouseButton and event.is_pressed():
		shoot()

func shoot():
	var node_laser = Laser.instantiate()
	node_laser.set_position(global_position)
	node_laser.set_rotation(get_rotation() + 1.57)
	node_root.add_child(node_laser)

func update(ball):
	ball.life -= ball.life
	life -= 1
	update_ui()

func update_ui():
	node_label_life.set_text(str(life))

func launch_ball():
	var node_ball = Ball.instantiate()
	node_ball.set_position(get_global_position() + Vector2.UP.rotated(rd.randf_range(0, 6.28)) * 1500)
	node_root.add_child(node_ball)
