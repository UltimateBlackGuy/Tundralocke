class_name Enemy
extends CharacterBody2D

enum STATES {Idle, Wandering, Chasing} 
var currentState = STATES.Wandering

#don't know why I need to use enum but it works

@export var speed: int
@export var NavAgent: NavigationAgent2D
@export var wander_area: Area2D

var target_node = null

func _ready():
	randomize()

func _physics_process(delta: float) -> void:
	 #will set up the states soon enough just lazy rn also the FUCK is elif
	if currentState == STATES.Idle:
		pass 
	elif currentState == STATES.Wandering:
		if NavAgent.is_navigation_finished(): #so it doesn't refresh every frame
			var random_point = get_random_point_in_wander_area()
			NavAgent.target_position = random_point
		move_along_path()
	elif currentState == STATES.Chasing:
		pass
	

func move_along_path():
	var dir = to_local(NavAgent.get_next_path_position()).normalized()
	velocity = dir * speed
	move_and_slide()

func get_random_point_in_wander_area():
	var shape = wander_area.get_node("CollisionShape2D").shape
	var radius = shape.radius

	var angle = randf_range(0, TAU) #Tau is just the full circle
	var r = radius * sqrt(randf()) #so it won't be close to the center

	var offset = Vector2(cos(angle), sin(angle)) * r #jumbled math bs
	return wander_area.global_position + offset #returns the random point for use

func _on_aggro_range_area_entered(area) -> void:
	if area is Player or area is Alurian:
		currentState = STATES.Chasing

func _on_de_aggro_range_area_exited(area) -> void:
	if area is Player or area is Alurian:
		currentState = STATES.Idle


func _on_recalc_navigation_timeout() -> void:
	pass # Replace with function body.
