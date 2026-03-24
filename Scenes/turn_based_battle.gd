extends Control

@onready var BattleManager = $StateMachine
@onready var Buttons = $PlayerAttackUI/PanelContainer/TurnbasedButtons
@onready var Options = $PlayerAttackUI/PanelContainer/Select
@onready var playerParty = $PlayerAttackUI/PanelContainer/PlayersAndEnemies/Players #Added on ready cause the game isnt ready at this moment in code
@onready var enemyParty = $PlayerAttackUI/PanelContainer/PlayersAndEnemies/Enemies

@onready var PlayerPhysical = $PlayersAndEnemyPhysical/Players
@onready var EnemyPhysical = $PlayersAndEnemyPhysical/Enemies


func startBattle():
	Buttons.get_node("AttackButton").grab_focus()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var enemy: PackedScene = load("res://Scenes/enemy.tscn")
	var friendly: PackedScene = load("res://Scenes/alurian_friend.tscn")
	
	var alurian1 = friendly.instantiate()
	playerParty.get_node("Friendly1").texture = alurian1.get_node("Sprite2D").texture
	PlayerPhysical.add_child(alurian1)
	alurian1.get_child(0).visible = false
	var alurian2 = friendly.instantiate()
	playerParty.get_node("Friendly2").texture = alurian2.get_node("Sprite2D").texture
	PlayerPhysical.add_child(alurian2)
	alurian2.get_child(0).visible = false
	
	var enemy1 = enemy.instantiate()
	EnemyPhysical.add_child(enemy1)
	enemy1.get_child(0).visible = false
	enemyParty.get_node("Enem1").texture = enemy1.get_node("Sprite2D").texture 
	var enemy2 = enemy.instantiate()
	EnemyPhysical.add_child(enemy2)
	enemy2.get_child(0).visible = false
	enemyParty.get_node("Enem2").texture = enemy2.get_node("Sprite2D").texture
	var enemy3 = enemy.instantiate()
	EnemyPhysical.add_child(enemy3)
	enemy3.get_child(0).visible = false
	enemyParty.get_node("Enem3").texture = enemy3.get_node("Sprite2D").texture
	
	startBattle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	BattleManager._Update()
