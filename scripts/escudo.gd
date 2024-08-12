extends Node2D

@onready var timer_ = get_node("Timer") as Timer
@onready var anim_2 = $anim2


func _ready():
	_nao_morrer()

func _nao_morrer():
	Global.pode_morrer = false
	
	

func _physics_process(delta):
	var segundo_restante = timer_.time_left
	
	if segundo_restante < 10:
		anim_2.play("out")
	

func _on_timer_timeout():
	Global.pode_morrer = true
	queue_free()
