extends CharacterBody2D

@export var speed: int = 350
@onready var sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if  Input.is_action_pressed("left"):
		sprite.frame = 1

	if  Input.is_action_pressed("right"):
		sprite.frame = 2
	
	if  Input.is_action_pressed("up"):
		sprite.frame = 3
	
	if  Input.is_action_pressed("down"):
		sprite.frame = 0
	
