extends Area2D


onready var animated_sprite = $animated_sprite
var state = "floating"

func _ready():
	pass # Replace with function body.


func _on_fruit_body_entered(body):
	state = "eaten"
	print('tada')
	animated_sprite.play("eaten")


func _on_animated_sprite_animation_finished():
	if animated_sprite.animation == "eaten":
		queue_free()
