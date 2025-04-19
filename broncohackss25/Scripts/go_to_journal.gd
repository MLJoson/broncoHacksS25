extends TextureButton

#var transition = $Transition

func _on_pressed() -> void:
	#transition.play("fade_out")
	get_tree().change_scene_to_file("res://Scenes/journal.tscn")

func _on_transition_animation_finished(anim_name):
	#get_tree().change_scene_to_file("res://Scenes/journal.tscn")
	print("")
