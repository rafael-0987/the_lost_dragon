extends CharacterBody2D

const caixa_dialog: PackedScene = preload("res://cenas/dialog.tscn")
const JUMP_VELOCITY = -400.0

@onready var static_ = $static
@onready var anim = $anim

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var interagirbool: bool = false
var descontar_lua: int = 30
var comprou: bool = false

var dialog_data: Dictionary = {
	0: {
		"title": "guardião",
		"face": "res://sprite/guardiao/face_mmarrom.png",
		"dialog": "tras 30 luas para mim!!! ai eu deixo você passar. OBS: aperte" + " 'l' " + "para dar a lua "
	}
}

func _physics_process(delta):
	_open()
	_dialog()
	if not is_on_floor():
		velocity.y += gravity * delta
		move_and_slide()


func _dialog() -> void:
	if interagirbool == false:
		return
	if interagirbool:
		if Input.is_action_just_pressed("interagir"):
			var instancia_caixa_dialog = caixa_dialog.instantiate()
			instancia_caixa_dialog.data = dialog_data
			add_child(instancia_caixa_dialog)
			

func _on_area_body_entered(body):
	if body.name == "player":
		interagirbool = true
		Global.saiu_da_area_interacao = true


func _on_area_body_exited(body):
	if body.name == "player":
		interagirbool = false
		Global.saiu_da_area_interacao = false

func _open():
	var tirar_lua: int = 30
	
	if comprou:
		return
	
	if interagirbool:
		if Input.is_action_just_pressed("dar_lua"):
			
			if Global.contagem_lua < descontar_lua:
				print("nao tem o bastante")
				return
			
			if Global.contagem_lua >= descontar_lua:
				anim.play("open")
				comprou = true
				print("tem lua")
				Global.contagem_lua -= descontar_lua
