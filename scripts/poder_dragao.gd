extends CharacterBody2D

var speed: int = 500

func _ready():
	global_position = Global.position_dragao + Vector2(50, 0)
	
	_move()
	move_and_slide()

func _physics_process(delta):
	move_and_slide()
	

func _move() -> void:
	var direction = global_position.direction_to(get_global_mouse_position())
	
	
	var rotation_ = atan2(direction.y, direction.x)
	
	rotation = rotation_
	
	velocity = direction * speed
	move_and_slide()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
