extends Node2D

@export_category("objtos")
@export var area: Area2D
@export var position_: Marker2D
@export var anim: AnimationPlayer

func _physics_process(_delta):
	
	if Global.position_bool:
		Global.position_player = position_.global_position

func _on_area__body_entered(body):
	if body.name == "player":
		Global.position_bool = true

		print("te amo amor, sempre amei e sepre amarei")


func _on_area_entreda_area_shape_entered(_area_rid, _area, _area_shape_index, _local_shape_index):
	anim.play("mae-gradao")
	print("veio ate aqui")
	


func _on_anim_animation_finished(anim_name):
	if anim_name == "mae-gradao":
		print("fim anim 1")
		Global.cena_final = true
