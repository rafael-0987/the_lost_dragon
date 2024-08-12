extends Node

#------posição do player---------
var position_player: Vector2
var position_bool: bool = false

#------POSIÇÃO DO DRAGAO--------
var position_dragao: Vector2

#------Nome Do player------
var name_player: String

#------se o player saiu da area de colisao da interacao----
var saiu_da_area_interacao: bool = false

#-----timer de jogo-----
var score_timer_: int 

#------o player irar levar o dragao------
var levar_dragao: bool = false
var planar_: bool = false

#------para ficar de noite------
var blackout_bool: bool = false

#------Planar------
var planar_bool: bool = false

#------para sumir o gradao quado planar------
var _sumir_gradao: bool = false

#------player colidiu com o chao-------
var player_colidiu: bool = false

#-----para aparecer a colisição do gradao----
var dragon_collision: bool = false

#----o player estar voando e o gradao nao pode expalar----
var not_spawn_dragao: bool = false

var _visible_banana: bool = false

var contagem_lua: int = 0

#----- o player esta no chao-----
var player_chao: bool = false

var cena_final: bool = false

#--------nao pode morrer------
var pode_morrer: bool = true

#-------checkpoint--------
var checkpoint: Vector2
