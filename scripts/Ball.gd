extends Area2D

const lifes = [1, 2, 3, 4]

@onready var node_sprite = get_node("BallSprite")
@onready var node_player = get_node("/root/World/PlayerArea2D")

var color = RandomNumberGenerator.new().randi_range(0, 3)
var life = lifes[color]

# Called when the node enters the scene tree for the first time.
func _ready():
	node_sprite.set_frame(color)
	look_at(node_player.get_global_position())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_position(get_position() + Vector2.RIGHT.rotated(get_rotation()) * delta * 300)


func _on_area_entered(area):
	area.update(self)
	check_life()

func check_life():
	if life <= 0:
		destroy()

func destroy():
	hide()
	queue_free()
