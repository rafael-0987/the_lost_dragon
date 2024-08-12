extends Control

@onready var b_play = $conteiner/play
@onready var b_quit = $conteiner/quit
@onready var _conteiner: VBoxContainer = get_node("conteiner")
@onready var namePlayer: LineEdit = _conteiner.get_node("namePlayer")

func _ready():
	b_play.grab_focus()
	


func _on_play_pressed():
	Global.name_player = namePlayer.text
	get_tree().change_scene_to_file("res://cenas/world.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_rank_pressed():
	get_tree().change_scene_to_file("res://cenas/rank/rank.tscn")
