extends Control


@onready var life = $life as Label
@onready var banana_: Node2D = get_node("banana_")
@onready var lua: Node2D = get_node("lua")
@onready var lua_label: Label = lua.get_node("label")

var contador: int = 0
var intervalo: int = 1  
var tempo: float = 0

var segundos: int = 59
var minutos: int = 0


func _process(delta):
	Global.score_timer_ = minutos
	_lua()
	_banana()
	tempo += delta
	
	if tempo >= intervalo:
		contador += 1
		tempo = 0
	
	if contador >= segundos:
		
		minutos += 1
		contador = 0
		
		
	life.text = str(minutos) + " : " + str(contador)

func _banana():
	if Global._visible_banana == true:
		banana_.visible = true
		return
	banana_.visible = false

func _lua():
	lua_label.text = str(Global.contagem_lua)
