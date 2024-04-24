extends Area2D

@export var speed_multiplier = 2
var speed = 400 * speed_multiplier
var angular_speed = PI * speed_multiplier
var radius = speed/angular_speed

func _ready():	position.y += -(radius)

func _process(delta):
	spin(delta)
	
func spin(delta):
	rotation += angular_speed * delta
	var direction = Vector2.RIGHT.rotated(rotation) * speed
	position += direction * delta
