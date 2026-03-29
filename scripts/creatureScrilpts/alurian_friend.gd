extends CharacterBody2D
class_name Alurian


@export var health: int
@export var power: int
@export var defense: int
@export var powerType: Array
@export var MaxEnergy: int
@export var powerScaling: int
@export var defenseScaling: int
@export var speed: int

var MoveNames = ["Claw", "Bite", "Fortify", "Dodge"] #Hard brackets for array


# Called when the node enters the scene tree for the first time.
func take_damage(amount):
	health -= amount - defense
	if health <= 0:
		health = 0
