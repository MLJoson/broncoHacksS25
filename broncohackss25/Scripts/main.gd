extends Control

@onready var transition = $Transition

func _ready() -> void:
	SignalBus.new_day.connect(_on_new_day)
	transition.play("fade_in")
func _on_new_day():
	pass
