extends Area2D
@export var sword_scene: PackedScene
@export var speed = 400
var count = 3.0
var arr = {}

func _ready():
	spawn_sword()
	$Timer.start()
	
func _process(delta):
	movement(delta)

func movement(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction.y += -1
	if Input.is_action_pressed("down"):
		direction.y += 1
	if Input.is_action_pressed("left"):
		direction.x += -1
	if Input.is_action_pressed("right"):
		direction.x += 1
	
	var velocity = direction.normalized() * speed
	position += velocity * delta
	
func spawn_sword():
	
	for i in range(count):
		arr[i] = sword_scene.instantiate()
		arr[i].rotation = (TAU/count) * (count-i)
		add_child(arr[i])
	

func add_sword():
	count += 1
	arr[arr.size()] = sword_scene.instantiate()
	print(arr.size())
	for i in range(count):
		arr[i].rotation = (TAU/count) * (count-i)
		add_child(arr[arr.size()-1])
	print(arr)


func _on_timer_timeout():
	pass#add_sword()
	
