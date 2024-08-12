extends CharacterBody2D

const caixa_dialog: PackedScene = preload("res://cenas/dialog.tscn")
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var dialog_data: Dictionary = {
	0: {
		"face": "res://sprite/dialog/pface.png",
		"title": Global.name_player,
		"dialog": "Oi terrildo, me chamou por quê?" 
	},
	1: {
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": " olá " + Global.name_player + " Tudo bem com voê?"
	},
	2: {
		"face": "res://sprite/dialog/pface.png",
		"title": Global.name_player,
		"dialog": "Sim"
	},
	3: {
		
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": "Se lebra daquele favorzinho que você estava me devendo.... "
	},
	4: {
		
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": " Entao.... queria que você levasse esse dragão que eu achei perdido da família dele"
	},
	5: {
		
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": "Você poderia leva-lo em segurança pra mim?"
	},
	6: {
		"face": "res://sprite/dialog/pface.png",
		"title": Global.name_player,
		"dialog": "Sim, acho que não tem como recuzar"
	},
	7: {
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": "FAISCAAAAA!!!!!!!"
	},
	8: {
		"face": "res://sprite/dialog/pface.png",
		"title": Global.name_player,
		"dialog": "Faisca?"
	},
	9: {
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": "sim!"
	},
	10: {
		
		"face": "res://sprite/dialog/terrildo_dialogo.png",
		"title": "terrildo",
		"dialog": "Faisca pode ir com ele, ele irar te levar at sua família"
	}
}

var interagirbool: bool = false


func _physics_process(delta):
	_move(delta)
	_dialog()

func _move(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
		
	#var direction = Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	

func _dialog() -> void:
	if interagirbool == true:
		if Input.is_action_pressed("interagir"):
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
