class_name Enemy
extends CharacterBody2D

enum STATES {Idle, Wandering, Chasing} 
var currentState = STATES.Idle

#don't know why I need to use enum but it works

@export var speed: int
@export var NavAgent: NavigationAgent2D

var target_node = null

func _ready():
	pass

func _process(delta: float) -> void:
	 #will set up the states soon enough just lazy rn also the FUCK is elif
	if currentState == STATES.Idle:
		pass 
	elif currentState == STATES.Wandering:
		pass
	elif currentState == STATES.Chasing:
		pass
	

func makePath(navAgent):
	pass

func _on_aggro_range_area_entered(area) -> void:
	if area is Player or area is Alurian:
		currentState = STATES.Chasing


func _on_de_aggro_range_area_entered(area) -> void:
	if area is Player or area is Alurian:
		currentState = STATES.Wandering


func _on_recalc_navigation_timeout() -> void:
	pass # Replace with function body.
