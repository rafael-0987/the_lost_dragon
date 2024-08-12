extends Area2D



@onready var anim: AnimationPlayer = get_node("anim")
@onready var sprite: Sprite2D = get_node("sprite")


func _on_body_entered(body):
	if body.name == "poder_dragao":
		anim.play("free")


func _on_anim_animation_finished(anim_name):
	if anim_name == "free":
		queue_free()


func _on_visible_on_screen_notifier_2d_screen_entered():
	print("entrouuuuu na tela")
