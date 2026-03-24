extends CharacterBody2D

@export var health: int
@export var power: int
@export var defense: int
@export var powerType: Array
@export var MaxEnergy: int
@export var powerScaling: int
@export var defenseScaling: int
@export var speed: int

func take_damage(amount):
	health -= amount - defense
	if health <=0:
		health = 0
		
