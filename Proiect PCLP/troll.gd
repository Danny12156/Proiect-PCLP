extends KinematicBody2D

const MOTION_SPEED = 320 # Pixels/second.

func _physics_process(_delta):
	var motion = Vector2()
	motion.x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	motion.y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	motion.y /= 2
	motion = motion.normalized() * MOTION_SPEED
	#warning-ignore:return_value_discarded
	move_and_slide(motion)





func _ready():
	set_collision_layer(1)
	set_collision_mask(1)

func _on_Area2D_body_entered(body):
	if body.is_in_group("Troll"):
		get_tree().change_scene("res://EndGame.tscn")
		
	
	
