extends CharacterBody2D

const scene_dragon: PackedScene = preload("res://cenas/dragao_pet/dragao_pet.tscn")

var JUMP_VELOCITY = -500.0

@onready var anim = $anim
@onready var sprite = $sprite
@onready var posicao: Marker2D = get_node("posicao")
@onready var camera = $camera
@onready var collision_2 = $collision2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


var SPEED = 300.0 as float
var speed_run = 500.0 as float

var planar_bool_: bool = false
var spawn_gradon: bool = false


func _ready():
	Global.checkpoint = Vector2(-1449, 379)
	global_position = Global.checkpoint

func _enter_tree():
	set_multiplayer_authority(name.to_int())

func _physics_process(delta):
	if is_on_floor():
		
		Global.player_chao = false
	else:
		Global.player_chao = true
	if velocity.x > 0:
		sprite.flip_h = false
		
	if velocity.x < 0:
		sprite.flip_h = true
		
	move_and_slide()
	_animation()
	#if is_multiplayer_authority():
	_move(delta)
	#_life_dragon()
	_posicao_marke()


func _move(delta):
	var direction = Input.get_axis("move_esquerda", "move_direita")
	
	var gravidade: int = 250
	var _speed: float = 0.5
	var _speed_rigdth: float = 450.0
	
	if is_on_floor():
		planar_bool_ = false
		
		
	if Input.is_action_pressed("planar") and planar_bool_ == true:
		
		Global._sumir_gradao = true
		spawn_gradon = true
			
		velocity.y = gravidade * _speed
			
		if direction:
			velocity.x = direction * _speed_rigdth
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		return
	
	Global.planar_bool = false
	Global._sumir_gradao = false
		
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if Input.is_action_pressed("run"):
		SPEED = speed_run
		return
	
	SPEED = 300.0
	

func _animation():
	if Input.is_action_pressed("planar") and !is_on_floor() and planar_bool_ == true:
		anim.play("planar")
		return
	if velocity.x > 0:
		sprite.flip_h = false
		
	if velocity.x < 0:
		sprite.flip_h = true
		
	if not is_on_floor():
		anim.play("jump")
		return
		
	if is_on_floor() and Input.is_action_pressed("run") and velocity != Vector2.ZERO:
		anim.play("run")
		return
		
	if velocity != Vector2.ZERO:
		anim.play("walk")
		return
		
	anim.play("idle")

func _posicao_marke():
	if Global.position_bool == true:
		return
	var _posicao_global = posicao.global_position
	if Input.is_action_pressed("planar"):
		Global.position_player = _posicao_global
		Global.planar_bool = true
		return
	Global.position_player = _posicao_global



func _on_area_planar_body_entered(body):
	if body.name == "dragao_pet":
		planar_bool_ = true
		

#func _life_dragon():
	
	#var instancia_scene_gradao = scene_dragon.instantiate()
	#if is_on_floor() and spawn_gradon:
	#	Global.player_colidiu = true
		#return
	#Global.player_colidiu = false
	

