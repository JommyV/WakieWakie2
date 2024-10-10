extends CanvasLayer



func _on_continue_button_pressed() -> void:
	visible = false
	get_tree().paused = false


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
	
