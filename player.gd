extends CharacterBody2D

@export var speed = 400
@export var jump_force = 40

var direction : Vector2
var motion    : Vector2

func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		while $Icon.position.y > -jump_force:
			$Icon.position.y -= 3
			await get_tree().process_frame
		
		await get_tree().create_timer(0.15).timeout
		
		while $Icon.position.y < 0:
			$Icon.position.y += 3
			await get_tree().process_frame
	
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	move_and_slide()
