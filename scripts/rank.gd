extends Control



@export var rank_conteiner: VBoxContainer = null

func _ready():
	
	
	var sw_result: Dictionary = await SilentWolf.Scores.get_scores().sw_get_scores_complete
	print("Scores: " + str(sw_result.scores))
	

	
	var _index: int = 0
	
	for _slot in rank_conteiner.get_children():
		if _slot is Label:
			continue
			
		_slot.get_node("position").text = str(_index + 1)
		_slot.get_node("name").text = sw_result.scores["player_name"]
		_slot.get_node("score").text = str(sw_result.scores["score"])
		
		_index += 1
