extends Area2D


func _on_body_entered(body):
	if body.name == "player" and Global.pode_morrer:
		Global.blackout_bool = false
		Global.contagem_lua = 0
		get_tree().reload_current_scene()
