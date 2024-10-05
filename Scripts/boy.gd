extends CharacterBody2D



const JUMP_VELOCITY = -500.0
const BACK_PEDAL_SPEED = -500.0
const TERMINAL_VELOCITY = 600
const TERMINAL_VELOCITY_BACK = -600
var speed = 150
@onready var sprite_2d: Sprite2D = %Sprite2D
@onready var tween: Tween 
var stop: bool = false
var normal: bool = true



func _physics_process(delta: float) -> void:
	print(velocity.x)
	if normal:
		if velocity.x >= 700:
			velocity.x = 700
		if velocity.x <= -700:
			velocity.x = -700
	
	velocity.y += clamp(get_gravity().y * delta / 2,TERMINAL_VELOCITY_BACK,TERMINAL_VELOCITY)
	if stop == false:
		velocity.x += speed * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and stop == false:
		velocity.y = JUMP_VELOCITY
	if stop == true:
		rotation += 2 * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("drink_coffee"):
		coffee_rush()


func _on_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		velocity.y = JUMP_VELOCITY


func i_sleep () -> void:
	#tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	#tween.set_loops().tween_property(sprite_2d, "rotation",180, 5)
	velocity = Vector2(0,0)
	stop = true

func coffee_rush() -> void:
	normal = false
	await get_tree().create_timer(5).timeout
	normal = true



func _on_brakes_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		velocity.x += -250
		#await get_tree().create_timer(0.1).timeout
		#speed = 5000
		#await get_tree().create_timer(0.1).timeout
		#speed = 500


func _on_accelerator_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		velocity.x += 250
