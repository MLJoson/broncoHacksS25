extends Node2D

func _ready() -> void:
	SignalBus.new_day.connect(_on_new_day)
	
func _on_new_day():
	pass
