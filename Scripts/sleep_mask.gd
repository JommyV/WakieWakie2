extends "res://Scripts/power_up_base.gd"


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		GameManager.sleepy_time()
		queue_free()
