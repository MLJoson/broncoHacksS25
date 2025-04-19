extends VBoxContainer

var task_scene = preload("res://Scenes/task.tscn")
var num_tasks = 0
var game_manager = load("res://Scripts/game_manager.gd").new()

func _ready():
	var actions = game_manager.get_actions()
	test_add_tasks(actions)

func _process(delta: float) -> void:
		# add_task("Task") #adds a task given a string
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

func test_add_tasks(actions): # takes in dictionary of array of Actions (string, dictionary)
	for act in actions:
		var action = act.get_name()
		var act_dict = act.get_effects()
		var aca_score = -19
		var soc_score = -19
		var well_score = -19
		for effect in act_dict:
			if effect == "academic":
				aca_score = act_dict[effect]
			elif effect == "social":
				soc_score = act_dict[effect]
			elif effect == "wellbeing":
				well_score = act_dict[effect]
		print(action, aca_score, soc_score, well_score)
		if (aca_score != -19 and soc_score != -19 and well_score != -19):
			add_task(action, aca_score, soc_score, well_score)
'''
var action_pool:= {
		"Walk": Action.new("Walk", {
		"energy": 5,
		"time": 1,
		"academic": 0, 
		"wellbeing": 5, 
		"social": 0
		}),
		
		"Friend_Hangout": Action.new("Friend Hangout", {
		"energy": 15,
		"time": 3,
		"academic": -10, 
		"wellbeing": 10, 
		"social": 10
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 10, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Chores": Action.new("Chores", {
		"energy": 20,
		"time": 2,
		"academic": -5, 
		"wellbeing": 5, 
		"social": -5
		}),
		
		"Brainrot": Action.new("Brainrot", {
		"energy": 0,
		"time": 4,
		"academic": -10, 
		"wellbeing": 10, 
		"social": -10
		}),
		
		"Gym": Action.new("Gym", {
		"energy": 20,
		"time": 2,
		"academic": -5, 
		"wellbeing": 15, 
		"social": 0
		}),
		
		"Study": Action.new("Study", {
		"energy": 20,
		"time": 2,
		"academic": 15, 
		"wellbeing": -5, 
		"social": -10
		}),
''' 
func clear():
	while get_child_count() > 0:
		num_tasks -= 1
		remove_child(get_child(num_tasks))
