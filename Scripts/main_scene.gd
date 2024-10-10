extends Node


var chinelo = load("res://Sprites/flipflop_idle.png")
var chinelo_2 = load("res://Sprites/flipflop_hit.png")
var chinelo_3 = load("res://Sprites/flipflop_move.png")
@onready var hud: CanvasLayer = %HUD
@onready var tutorialhud: CanvasLayer = %TUTORIALHUD
@onready var lostscreen: CanvasLayer = %LOSTSCREEN
@onready var audio_stream_player_2d: AudioStreamPlayer2D = %AudioStreamPlayer2D



func _ready() -> void:
	GameManager.i_sleep = true
	await get_tree().create_timer(1.5).timeout
	tutorialhud.visible = true
	GameManager.i_sleep = false
	get_tree().paused = true
	lostscreen.visible = false



func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_game"):
		hud.visible = true
		get_tree().paused = true
	if Input.is_action_just_pressed("play_again") and GameManager.lost:
		GameManager.lost = false
		get_tree().reload_current_scene()
		
		
