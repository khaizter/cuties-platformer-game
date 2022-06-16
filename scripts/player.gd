extends KinematicBody2D

onready var animated_sprite = $animated_sprite
onready var velocity_label = $ui/CanvasLayer/velocity_label
var vel = Vector2.ZERO
export var move_speed = 60
export var grav = 5
export var jump_power = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vel.y += grav
	vel.x = (int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))) * move_speed
	
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		vel.y += -jump_power
	
	vel = move_and_slide(vel, Vector2.UP)
	update_animation()
	update_facing()
	
	velocity_label.text = 'vel' + String(vel)

func update_animation():
	if (is_on_floor()):
		if (vel.x != 0):
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		if (vel.y < 0):
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")
func update_facing():
	if (vel.x != 0):
		animated_sprite.flip_h = vel.x < 0
