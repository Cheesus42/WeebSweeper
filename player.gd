extends Area2D
@export var sword_scene: PackedScene
@export var speed = 400
var count = 6.0
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
		#if i > 0:
			#for j in range(i):
				#arr[(i-1)].rotation += (2*PI)/count
		#arr[i] = sword_scene.instantiate()
		#add_child(arr[i])
	for i in range(count):
		arr[i] = sword_scene.instantiate()
		arr[i].rotation = (2*PI) * ((count-i)/count)
		add_child(arr[i])

func add_sword():
	count += 1
	arr[arr.size()] = sword_scene.instantiate()
	print(arr.size())
	for i in range(count):
		arr[i].rotation = (2*PI) * (((count)-i)/(count))
	add_child(arr[arr.size()-1])


func _on_timer_timeout():
	add_sword()
