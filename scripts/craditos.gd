extends Control

@onready var label = $Label as Label



var speed: Vector2 = Vector2(0,-2)

func _physics_process(delta):

	label.global_position += speed


func _on_button_pressed():
	get_tree().change_scene_to_file("res://cenas/menu.tscn")
