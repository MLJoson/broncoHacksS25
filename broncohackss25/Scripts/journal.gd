extends Control

signal day_over

func _on_button_pressed() -> void:
	#set_modulate(lerp(get_modulate(), Color(0,0,0,1), 0.2))
	day_over.emit()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
