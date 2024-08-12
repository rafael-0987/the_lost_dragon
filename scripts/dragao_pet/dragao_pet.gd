extends CharacterBody2D

const scene_power_dragon: PackedScene = preload("res://cenas/poder_dragao.tscn")

var speed: int = 270
var stop: bool 
var distence: int = 290
var seguir: bool = false

@onready var collision: CollisionShape2D = get_node("collisio")
@onready var sprite = $sprite
@onready var anim = $anim
@onready var area_de_parar: Area2D = get_node("area_de_parar")
@onready var collision2 = $area_de_parar/collision

@export_category("objetos")


func _ready():
	if Global.not_spawn_dragao:
		queue_free()
	if Global.player_colidiu:
		global_position = Global.position_player
		
	

func _physics_process(_delta):
	Global.position_dragao = self.global_position
	_spawn_power()
	_live_dragon()
	if Global.levar_dragao == true:
		_move()
		
	_anim()
	
	
	if Global.position_bool:
		var direction = global_position.direction_to(Global.position_player)
		
		velocity = direction * speed
		_move()
		return
		
		
	_planar()
	_spawn_area()

func _move():
	
		
	anim.play("voando")
	var direction = global_position.direction_to(Global.position_player)
	if stop == false or Global.planar_bool:
		move_and_slide()
		velocity = direction * speed
		
		if Input.is_action_pressed("planar"):
			speed = 1000
			return
			
	var _distancia = global_position.distance_to(Global.position_player)
	if _distancia > distence:
		speed = 550
		return
		
	speed = 270
	

func _anim():
	if velocity.x > 0:
		sprite.flip_h = false
		
	else:
		sprite.flip_h = true

func _on_area_de_parar_body_entered(body):
	if Global.position_bool:
		return
	if body.name == "player":
		stop = true

func _on_area_de_parar_body_exited(body):
	if body.name == "player":
		stop = false


func _on_anim_animation_finished(anim_name):
	if anim_name == "levantando":
		seguir = true
		Global.levar_dragao = false
		
	
func _planar():
	if Global.planar_bool:
		area_de_parar.visible = false
		return
	
	area_de_parar.visible = true

#func _on_area_visible_body_entered(body):
func _live_dragon():
	
	if Global._sumir_gradao == false:
		self.visible = true
		
	else:
		self.visible = false
		

#-----para aparecer a area que colide co o player-----
func _spawn_area():
	if Global.dragon_collision:
		collision.visible = true




func _on_area_visible_area_shape_entered(_area_rid, area, _area_shape_index, _local_shape_index):
	if area.name == "mae_gradao":
		queue_free()


func _on_area_final_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	queue_free()

func _spawn_power() -> void:
	var instancia_power = scene_power_dragon.instantiate()
	if Input.is_action_just_pressed("attack"):
		get_parent().add_child(instancia_power)
		instancia_power.global_position = self.global_position
		
