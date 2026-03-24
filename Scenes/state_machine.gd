extends Node

var CurrentState
@export var InitialState: Script

func _enter(state, oldState):
	if oldState == state:
		return
	
	state.IsActive = true
	CurrentState = state
	_exit(oldState)


func _exit(state):
	if state.IsActive == true:
		state.IsActive = false
	
	if state.IsActive == false:
		return	

func _Update():
	pass
	
