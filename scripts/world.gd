extends Node2D


@export_category("objetos")
@export var blackout: CanvasModulate

func _ready():
	blackout.visible = false

func _physics_process(_delta):
	
	_blackout()

func _blackout():
	if Global.blackout_bool == true:
		blackout.visible = true
		
	else:
		blackout.visible = false



var peer = ENetMultiplayerPeer.new()

@export var player_cena: PackedScene


func _on_host_pressed():
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	
	_add_player()
	
	
func _add_player(id = 1):
	var player_ = player_cena.instantiate()
	player_.name = str(id)
	call_deferred("add_child", player_)

func _on_join_pressed():
	peer.create_client("localhost", 135)
	multiplayer.multiplayer_peer = peer

	
