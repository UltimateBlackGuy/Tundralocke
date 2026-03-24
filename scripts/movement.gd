extends CharacterBody2D

@export var speed: int = 350
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("sprint"):
		speed = 450
		$ColorRect.color = Color.RED
	
	if Input.is_action_just_released("sprint"):
		speed = 350
		$ColorRect.color = Color.WHITE
	
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
