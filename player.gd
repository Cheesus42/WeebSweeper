extends Area2D
@export var speed = 400

func _process(delta):
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
	
