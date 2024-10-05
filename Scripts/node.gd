extends Node


var chinelo = load("res://Sprites/chinelo_pequeno_menor_ainda.png")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_custom_mouse_cursor(chinelo)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
