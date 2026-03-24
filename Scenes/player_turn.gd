extends Node

@export var IsActive: bool
#Dont mind how incredibly unoptimized this is
var FirstAlurian
var SecondAlurian

var Enemy1
var Enemy2
var Enemy3

@onready var playerGroup = $PlayerAttackUI/PanelContainer/PlayersAndEnemies/Players
@export var playerTurns: int
@export var enemyTurns: int

@onready var TurnBasedButtons = $"../../PlayerAttackUI/PanelContainer/TurnbasedButtons"
@onready var SelctionMenu = $"../../PlayerAttackUI/PanelContainer/Select"

var attackButton
var attackButton2
var DefendButton
var DodgeButton
var ItemButton
var option1
var option2
var option3
var exit_nextPage

var ButtonPressedTimer 
var CurrentButton
var players
var enemies

func _ready():
	var players = $"../../PlayersAndEnemyPhysical/Players"
	playerTurns = players.get_child_count()
	var enemies = $"../../PlayersAndEnemyPhysical/Enemies"
	enemyTurns = enemies.get_child_count()
	#holy shit their are so many variables here
	attackButton = TurnBasedButtons.get_node("AttackButton")
	attackButton2 = TurnBasedButtons.get_node("AttackButton2")
	DefendButton = TurnBasedButtons.get_node("Defend")
	DodgeButton = TurnBasedButtons.get_node("Dodge")
	ItemButton = TurnBasedButtons.get_node("Item")
	ButtonPressedTimer = $ButtonPressed
	option1 = SelctionMenu.get_node("Option1")
	option2 = SelctionMenu.get_node("Option2")
	option3 = SelctionMenu.get_node("Option3")
	exit_nextPage = SelctionMenu.get_node("Option4")


func ButtonPressed(button):
	ButtonPressedTimer.start()
	button.grab_focus()
	button.disabled = true

func _on_attack_button_pressed() -> void:
	if IsActive == true:
		CurrentButton = attackButton
		FirstAlurian = players.get_child(0)
		attackButton.text = FirstAlurian.MoveNames[0] #0 is the first in the array
		
		
	else:
		return

func _on_button_pressed_timeout() -> void:
	CurrentButton.disabled = false
