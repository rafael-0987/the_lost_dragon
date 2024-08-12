extends Area2D


func _on_body_entered(body):
	if body.name == "player":
		Global._visible_banana = true
		queue_free()
