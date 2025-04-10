extends Area3D

@onready var room = $Room
@export var isInside : bool
@export var enterEvent : WwiseEvent
@export var exitEvent : WwiseEvent


func _on_body_entered(body):
	print(body.name+" entered")
	Wwise.set_game_object_in_room(body, room)
	if isInside && body.is_in_group("player"):
		Wwise.set_state("AmbientState","Inside")
		enterEvent.post(self)


func _on_body_exited(body):
	print(body.name+" exited")
	Wwise.remove_game_object_from_room(body)
	if isInside && body.is_in_group("player"):
		Wwise.set_state("AmbientState","Outside")
		exitEvent.post(self)
