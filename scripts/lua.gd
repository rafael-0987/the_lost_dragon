extends Area2D

@onready var plohh = $plohh

var lua_: int = 1

func _on_body_entered(body):
	if body.name == "player":
		plohh.playing = true
		Global.contagem_lua += lua_
		


func _on_plohh_finished():
	queue_free()
