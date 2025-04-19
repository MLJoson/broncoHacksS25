extends VBoxContainer

var task_scene = preload("res://Scenes/task.tscn")
var num_tasks = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("add_task"):
		add_task("Task") #adds a task given a string

func add_task(task_name: String):
	var task_instance = task_scene.instantiate()
	add_child(task_instance)
	get_child(num_tasks).get_child(1).text = task_name
	num_tasks += 1
