extends VBoxContainer

var task_scene = preload("res://Scenes/task.tscn")
var num_tasks = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("add_task"):
		add_task("Task", 5, -5, 5) #adds a task given a string
	if Input.is_action_just_pressed("clear"):
		clear()

func add_task(task_name: String, academic_stat: int, social_stat: int, stress_stat : int):
	var task_instance = task_scene.instantiate()
	add_child(task_instance)
	get_child(num_tasks).get_child(0).get_child(0).get_child(1).text = task_name
	
	var aca_text = get_child(num_tasks).get_child(0).get_child(1).get_child(0)
	var social_text = get_child(num_tasks).get_child(0).get_child(1).get_child(1)
	var stress_text = get_child(num_tasks).get_child(0).get_child(1).get_child(2)
	
	if academic_stat > 0:
		aca_text.text = "academic ↑"
	else:
		aca_text.text = "academic ↓"
	
	if social_stat > 0:
		social_text.text = "social ↑"
	else:
		social_text.text = "social ↓"
	
	if stress_stat > 0:
		stress_text.text = "stress ↑"
	else:
		stress_text.text = "stress ↓"
	
	num_tasks += 1

func clear():
	while get_child_count() > 0:
		num_tasks -= 1
		remove_child(get_child(num_tasks))
