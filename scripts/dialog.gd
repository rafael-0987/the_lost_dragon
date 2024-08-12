extends CanvasLayer


@onready var conteiner = get_node("conteiner")
@onready var text_label: RichTextLabel = get_node("text_label")
@onready var esprite_name = $conteiner/esprite_name
@onready var label = $conteiner/label
@onready var face: TextureRect = get_node("face")



var data: Dictionary = {}
var _id: int = 0
var _step: float = 0.05


func _ready():
	_initialize_dialog()
	

func _process(_delta):
	if Global.saiu_da_area_interacao == false:
		queue_free()
		
	
	if Input.is_action_pressed("advance") and text_label.visible_ratio < 1:
		_step = 0.01
		return
		
	_step = 0.05
	if Input.is_action_just_pressed("advance"):
		_id += 1
		if _id == data.size():
			Global.levar_dragao = true
			queue_free()
			return
			
		_initialize_dialog()

func _physics_process(delta):
	_move_name(delta)
	
func _initialize_dialog():
	text_label.text = data[_id]["dialog"]
	label.text = data[_id]["title"]
	face.texture = load(data[_id]["face"])
	
	
	text_label.visible_characters = 0
	while text_label.visible_ratio < 1:
		await  get_tree().create_timer(_step).timeout
		text_label.visible_characters += 1
		

func _move_name(_delta):
	if conteiner.position == Vector2(917,308):
		return
	conteiner.position.y += -1
