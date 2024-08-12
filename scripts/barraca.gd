extends Node2D

const scene_inventory: PackedScene = preload("res://cenas/inventory_loja.tscn")

@export_category("obj")
@export var anim: AnimationPlayer


var player_entrou: bool = false
var is_open: bool = false

func _physics_process(delta):
	_close()
	_is_open()
	if Input.is_action_just_pressed("interagir") and player_entrou:
			anim.play("subindo")
			
		
	

func _is_open():
	var player = get_parent().get_child(18)
	var camera_player = player.get_child(2)
	var camera_tamanho: Vector2 = Vector2(3.5, 3.5)
	
	
	
	
	var instancia_inventory = scene_inventory.instantiate()
	
	if Input.is_action_just_pressed("comprar") and is_open:
		instancia_inventory.global_position = global_position + Vector2(0, -100)
		get_parent().add_child(instancia_inventory)
		
		
		player.visible = false
		camera_player.zoom = camera_tamanho
		camera_player.position.y += -90
		
		

func _close() -> void:
	var player = get_parent().get_child(18)
	var camera_player = player.get_child(2)
	var camera_tamanho_normal: Vector2 = Vector2(1, 1)
	
	if Input.is_action_just_pressed("esc") and player_entrou:
		player.visible = true
		camera_player.zoom = camera_tamanho_normal
		camera_player.position.y += 90
		get_tree().paused = false
		
		
	
func _on_area_body_entered(body):
	if body.name == "player":
		player_entrou = true
		is_open = true
		


func _on_anim_animation_finished(anim_name):
	if anim_name == "subindo":
		anim.play("cima")


func _on_area_body_exited(body):
	if body.name == "player":
		player_entrou = false
		
