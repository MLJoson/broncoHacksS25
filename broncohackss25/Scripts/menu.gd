extends Control

@onready var transition = $Transition

func _ready():
	transition.play("fade_in")

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_quit_pressed():
	get_tree().quit()
