extends CanvasLayer

@onready var anim = $anim


func _physics_process(delta):
	if Global.cena_final == true:
		self.visible = true
		anim.play("fade_in")

func _on_anim_animation_finished(anim_name):
	_save_data()
	get_tree().change_scene_to_file("res://cenas/craditos.tscn")


func _save_data():
	
	var sw_result: Dictionary = await SilentWolf.Scores.save_score(Global.name_player, Global.score_timer_).sw_save_score_complete
	print("Score persisted successfully: " + str(sw_result.score_id))
		
		
	#SilentWolf.Scores.save_score(Global.name_player, Global.score_timer_)
	#await SilentWolf.Scores.sw_save_score_complete
