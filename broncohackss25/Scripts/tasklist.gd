extends VBoxContainer

var task_scene = preload("res://Scenes/task.tscn")
var num_tasks = 0
var game_manager = load("res://Scripts/game_manager.gd").new()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("add_task"):
		var tasks = game_manager.pool_to_array()
		test_add_tasks(tasks)
		# add_task("Task") #adds a task given a string
	if Input.is_action_just_pressed("clear"):
		clear()

func add_task(task_name: String):
	var task_instance = task_scene.instantiate()
	add_child(task_instance)
	get_child(num_tasks).get_child(1).text = task_name
	num_tasks += 1

func test_add_tasks(tasks):
	for task in tasks:
		add_task(task)

func clear():
	while get_child_count() > 0:
		num_tasks -= 1
		remove_child(get_child(num_tasks))
