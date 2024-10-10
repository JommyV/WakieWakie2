extends "res://Scripts/power_up_base.gd"


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.x += 500
		GameManager.coffee_rush()
		queue_free()
