extends Area2D

@onready var marker_2d: Marker2D = %Marker2D


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.i_sleep()
		body.global_position = marker_2d.global_position
		GameManager.lost = true
