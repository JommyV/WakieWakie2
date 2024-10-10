extends CharacterBody2D



const JUMP_VELOCITY = -500.0
const BACK_PEDAL_SPEED = -500.0
const TERMINAL_VELOCITY = 600
const TERMINAL_VELOCITY_BACK = -600
var speed = 150
@onready var tween: Tween 
var stop: bool = false
var normal: bool = true
@onready var brakes: Area2D = $Brakes
@onready var accelerator: Area2D = $Accelerator
@onready var jump: Area2D = $Jump
@onready var accelerator_chinelo: AnimatedSprite2D = %AcceleratorChinelo
@onready var jump_chinelo: AnimatedSprite2D = %JumpChinelo
@onready var brake_chinelo: AnimatedSprite2D = %BrakeChinelo
@onready var sprite_2d_2: Sprite2D = %Sprite2D2
@onready var spin_animation: AnimatedSprite2D = %SpinAnimation
@onready var snore: AudioStreamPlayer2D = %Snore
@onready var main_music: AudioStreamPlayer2D = %MainMusic

var spinning: bool = false


func _ready() -> void:
	velocity.x = 1000


func _physics_process(delta: float) -> void:
	if !GameManager.speed_rush:
		if velocity.x >= 2500:
			velocity.x = 2500
		if velocity.x <= -2500:
			velocity.x = -2500

	if stop == false:
		velocity.x += speed * delta
		if !GameManager.broom_glide:
			velocity.y += clamp(get_gravity().y * delta / 2,TERMINAL_VELOCITY_BACK,TERMINAL_VELOCITY)
	else:
		velocity = Vector2(0,0)
	#if Input.is_action_just_pressed("ui_accept") and stop == false and !GameManager.i_sleep:
		#velocity.y = JUMP_VELOCITY
	#if stop == true:
		#rotation += 2 * delta
	move_and_slide()
	
	if Input.is_action_just_pressed("restart_game"):
		get_tree().reload_current_scene()
	#if velocity.y > 200 or velocity.y > -200:
		#sprite_2d.set_texture(preload("res://Sprites/sleepy_guy_fly_centrado.png"))
	#else:
		#sprite_2d.set_texture(preload("res://Sprites/sleepy_guy_rotate_centrado.png"))
	#sprite_2d.rotation += 5
		
		
func i_sleep () -> void:
	
	velocity = Vector2(0,0)
	stop = true
	sprite_2d_2.visible = true
	spin_animation.visible = false
	snore.play()
	tween = create_tween().set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_LINEAR)
	tween.set_loops().tween_property(main_music, "volume_db",-25, 4)


func coffee_rush() -> void:
	normal = false
	await get_tree().create_timer(5).timeout
	normal = true


func _on_brakes_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and !GameManager.i_sleep:
		velocity.x += -250
		brake_chinelo.visible = true
		brake_chinelo.play()
		if spinning == false:
			sprite_2d_2.visible = false
			spin_animation.visible = true
			spinning = true
		



func _on_accelerator_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and !GameManager.i_sleep:
		velocity.x += 250
		accelerator_chinelo.visible = true
		accelerator_chinelo.play()
		if spinning == false:
			sprite_2d_2.visible = false
			spin_animation.visible = true
			spinning = true


func _on_jump_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and !GameManager.i_sleep:
		velocity.y = JUMP_VELOCITY
		jump_chinelo.visible = true
		jump_chinelo.play()
		if spinning == false:
			sprite_2d_2.visible = false
			spin_animation.visible = true
			spinning = true


func _on_accelerator_chinelo_animation_finished() -> void:
	accelerator_chinelo.visible = false


func _on_jump_chinelo_animation_finished() -> void:
	jump_chinelo.visible = false


func _on_brake_chinelo_animation_finished() -> void:
	brake_chinelo.visible = false
