extends Node2D

@onready var animation = $AnimatedSprite2D
var game_manager = load("res://Scripts/game_manager.gd").new()
func _ready():
	game_manager.calculate_stu()  # Make sure it's updated
	match game_manager.stu_status:
		0: animation.play("normal")
		1: animation.play("happy")
		2: animation.play("shrimpin")
		3: animation.play("crash out")
		4: animation.play("normal")
		5: animation.play("studious")
		6: animation.play("tired")
	#animation.play("normal")
