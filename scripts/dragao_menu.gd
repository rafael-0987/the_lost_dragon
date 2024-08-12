extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
var speed: int = 300

func _physics_process(delta):
	_move()
	_animate()

func _move():
	
	var direction: Vector2 = _direction()
	velocity = direction * speed
	move_and_slide()

func _direction():
	return Vector2(
		Input.get_axis("move_esquerda", "move_direita"),
		Input.get_axis("move_cima","move_baixo")
	).normalized()

func _animate():
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
		
