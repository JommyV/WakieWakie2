extends Node

@onready var speed_rush: bool = false
@onready var broom_glide: bool = false 
@onready var i_sleep: bool = false
@onready var player_name: String

# Called when the node enters the scene tree for the first time.
func coffee_rush() -> void:
	speed_rush = true
	await get_tree().create_timer(5).timeout
	speed_rush = false
	

func sleepy_time() -> void: 
	i_sleep = true
	await get_tree().create_timer(3).timeout
	i_sleep = false
	
	
func flying() -> void:
	broom_glide = true
	await get_tree().create_timer(2).timeout
	broom_glide = false
