extends Node2D


const scene_escudo: PackedScene = preload("res://cenas/escudo.tscn")

@onready var button_1 = $slot_1/compra_1
@onready var valor_1 = $slot_1/valor_1
@onready var texture_1 = $slot_1/texture
@onready var sprite_escudo = $slot_1/sprite_escudo
@onready var name_item = $slot_1/name_item

var preco_1: int = 0
var ja_comprou: bool = false

func _ready():
	_preco()
	button_1.grab_focus()
	get_tree().paused = true
	

func _physics_process(delta):
	if Input.is_action_just_pressed("esc"):
		queue_free()

func _on_compra_1_pressed():
	var escudo_instancia = scene_escudo.instantiate()
	var player_ = get_parent().get_child(18)
	if Global.contagem_lua < preco_1 or ja_comprou:
		return
		
	
	name_item.visible = false
	sprite_escudo.visible = false
	Global.contagem_lua -= preco_1
	
	player_.add_child(escudo_instancia)
	
	ja_comprou = true
	

func _preco() -> void:
	valor_1.text = str(preco_1)


