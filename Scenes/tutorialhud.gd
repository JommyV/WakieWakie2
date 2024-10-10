extends CanvasLayer

@onready var acceltxt: Label = %Acceltxt
@onready var jumptxt: Label = %Jumptxt
@onready var braketxt: Label = %Braketxt
@onready var accel_arrow: Sprite2D = %AccelArrow
@onready var brake_arrow: Sprite2D = %BrakeArrow
@onready var jump_arrow: Sprite2D = %JumpArrow
@onready var jump_hgl: Label = %JumpHgl
@onready var brake_hgl: Label = %BrakeHgl
@onready var accel_hgl: Label = %AccelHgl
@onready var tween: Tween 
@onready var button: Button = %Button
@onready var jump_button: Button = %JumpButton
@onready var brake_button: Button = %BrakeButton
@onready var accel_button: Button = %AccelButton
@onready var label: Label = %Label

var position: int = 0



func _ready() -> void:
	while position == 0:
		accel_button.visible = true
		acceltxt.visible = true
		accel_arrow.visible = true
		accel_hgl.visible = true
		await get_tree().create_timer(0.6).timeout
		accel_hgl.visible = false
		await get_tree().create_timer(0.6).timeout
	
	while position == 1:
		accel_button.visible = false
		brake_button.visible = true
		acceltxt.visible = false
		braketxt.visible = true
		accel_arrow.visible = false
		brake_arrow.visible = true
		brake_hgl.visible = true
		await get_tree().create_timer(0.6).timeout
		brake_hgl.visible = false
		await get_tree().create_timer(0.6).timeout

	while position == 2:
		accel_button.visible = false
		brake_button.visible = false
		jump_button.visible = true
		accel_arrow.visible = false
		brake_arrow.visible = false
		jump_arrow.visible = true
		acceltxt.visible = false
		braketxt.visible = false
		jumptxt.visible = true
		jump_hgl.visible = true
		await get_tree().create_timer(0.6).timeout
		jump_hgl.visible = false
		await get_tree().create_timer(0.6).timeout

	
	if position == 3:
		accel_button.visible = false
		brake_button.visible = false
		jump_button.visible = false
		accel_arrow.visible = false
		brake_arrow.visible = false
		jump_arrow.visible = false
		acceltxt.visible = false
		jumptxt.visible = false
		braketxt.visible = false
		jump_hgl.visible = false
		button.text = "Start Game"
		label.visible = true



func _on_button_pressed() -> void:
	position += 1
	if position == 4:
		get_tree().paused = false
		self.visible = false
