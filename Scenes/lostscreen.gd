extends CanvasLayer




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.lost == true:
		self.visible = true
