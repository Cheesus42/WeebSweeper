extends Node2D

@export var speed = 1
var angular_speed = PI * speed
@export var sword_offset = 100

var score = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	$Sword.position = offset(1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	spin(delta)

func offset(number):
	var offset = Vector2(0, sword_offset).rotated((2*PI)/number)
	return offset
	
func spin(delta):
	rotation += angular_speed * delta
	
func duplicate_sword(count):
	pass
	
	
