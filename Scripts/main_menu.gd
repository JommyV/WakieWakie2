extends Control


@onready var start_button: Button = %StartButton
@onready var quit_button: Button = %QuitButton


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
