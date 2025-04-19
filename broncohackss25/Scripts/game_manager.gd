extends Node

#Connect to player_status file
@export var PlayerStatus: PlayerStatus

#Action class to define actions for player
class Action:
	var name: String
	var effects: Dictionary
	
	func _init(_name: String, _effects: Dictionary):
		name = _name
		effects = _effects

#make planned actions from user
var planned_actions: Array[Action] = []
##the randomized options player can choose
#var action_pool:= {
	##Major events
	#"Exams": Action.new("Exams", {
		#"energy": 20,
		#"time": 1,
		#"academic": 10, 
		#"wellbeing": 5, 
		#"social": -5
	#}),
	#"Quiz": Action.new("Quiz", {
		#"energy": 10,
		#"time": 1,
		#"academic": 0, 
		#"wellbeing": 5, 
		#"social": 0
	#}),
	#
	##Minor events
	#"Club_Meeting": Action.new("Club Meeting", {
		#"energy": 10,
		#"time": 1,
		#"academic": -5, 
		#"wellbeing": 5, 
		#"social": 5
	#}),
	#"Acad_Club_Meeting": Action.new("Academic Club Meeting", {
		#"energy": 10,
		#"time": 1,
		#"academic": 5, 
		#"wellbeing": -5, 
		#"social": 5
	#}),
	#"Study": Action.new("Study", {
		#"energy": 10,
		#"time": 2,
		#"academic": 10, 
		#"wellbeing": 0, 
		#"social": -5
	#}),
	#"Office_Hours": Action.new("Office Hours", {
		#"energy": 5,
		#"time": 1,
		#"academic": 10, 
		#"wellbeing": 0, 
		#"social": 2
	#}),
	#"Friend_Hangout": Action.new("Friend Hangout", {
		#"energy": 20,
		#"time": 3,
		#"academic": -10, 
		#"wellbeing": 10, 
		#"social": 15
	#}),
	#"Alone_Time": Action.new("Alone Time", {
		#"energy": 10,
		#"time": 2,
		#"academic": -10, 
		#"wellbeing": 10, 
		#"social": 0
	#}),
	#"Gym": Action.new("Gym", {
		#"energy": 15,
		#"time": 2,
		#"academic": -10, 
		#"wellbeing": 15, 
		#"social": 0
	#})
#}
#
##daily action pool
#var daily_action_pool: = {
	##Daily events
	#"Attend_Class": Action.new("Attend Class", {
		#"energy": 25,
		#"time": 3,
		#"academic": 10, 
		#"wellbeing": 5, 
		#"social": 0
	#}),
	#"Get_Food": Action.new("Get Food", {
		#"energy": 10,
		#"time": 1,
		#"academic": 0, 
		#"wellbeing": 5, 
		#"social": 0
	#}),
	#"Chores": Action.new("Chores", {
		#"energy": 10,
		#"time": 1,
		#"academic": 0, 
		#"wellbeing": 5, 
		#"social": -5
	#})
#}

#1-7 sunday - saturday
var current_day: int = 1
var current_day_actions: Array[Action] = []
var actions_per_day: int = 4
var action_pool = {}

#picks random actions from the day
func generate_actions():
	current_day_actions.clear()
	match current_day:
		1:
			sunday()
		2:
			monday()
		3:
			tuesday()
		4:
			wednesday()
		5:
			thursday()
		6:
			friday()
		7:
			saturday()
		_:
			print("no more days")
	#var keys = action_pool.keys()
	#keys.shuffle()
	#
	##Pick the actions for the day 
	#for i in range(actions_per_day):
		#if i < keys.size():
			#current_day_actions.append(action_pool[keys[i]])

#sunday and its task
func sunday():
	action_pool = {
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
	}

#monday and its task
func monday():
	var action_pool:= {
		"Class": Action.new("Class", {
		"energy": 30,
		"time": 3,
		"academic": 20, 
		"wellbeing": -10, 
		"social": 0
		}),
		
		"Study": Action.new("Study", {
		"energy": 15,
		"time": 2,
		"academic": 10, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 5, 
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
		
		"Alone_Time": Action.new("Alone Time", {
		"energy": 10,
		"time": 2,
		"academic": -5, 
		"wellbeing": 10, 
		"social": -10
		}),
	}

#tuesday and its task
func tuesday():
	var action_pool:= {
		"Class": Action.new("Class", {
		"energy": 20,
		"time": 2,
		"academic": 15, 
		"wellbeing": -10, 
		"social": 0
		}),
		
		"Club_Meeting": Action.new("Club", {
		"energy": 10,
		"time": 1,
		"academic": 5, 
		"wellbeing": 5, 
		"social": 10
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 5, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Office_Hours": Action.new("Office Hours", {
		"energy": 15,
		"time": 2,
		"academic": 15, 
		"wellbeing": -10, 
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
		
		"Friend_Hangout": Action.new("Friend Hangout", {
		"energy": 20,
		"time": 2,
		"academic": -10, 
		"wellbeing": 10, 
		"social": 15
		}),
	}

#wednesday and its task
func wednesday():
	var action_pool:= {
		"Class": Action.new("Class", {
		"energy": 30,
		"time": 3,
		"academic": 20, 
		"wellbeing": -15, 
		"social": 0
		}),
		
		"Study": Action.new("Study", {
		"energy": 15,
		"time": 2,
		"academic": 10, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 5, 
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
		
		"Alone_Time": Action.new("Alone Time", {
		"energy": 10,
		"time": 2,
		"academic": -5, 
		"wellbeing": 10, 
		"social": -10
		}),
	}

#thursday and its task
func thursday():
	var action_pool:= {
		"Class": Action.new("Class", {
		"energy": 20,
		"time": 2,
		"academic": 15, 
		"wellbeing": -10, 
		"social": 0
		}),
		
		"Club_Meeting": Action.new("Club", {
		"energy": 10,
		"time": 1,
		"academic": 5, 
		"wellbeing": 5, 
		"social": 10
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 5, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Office_Hours": Action.new("Office Hours", {
		"energy": 15,
		"time": 2,
		"academic": 15, 
		"wellbeing": -10, 
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
		
		"Friend_Hangout": Action.new("Friend Hangout", {
		"energy": 20,
		"time": 2,
		"academic": -10, 
		"wellbeing": 10, 
		"social": 15
		}),
	}

#friday and its task
func friday():
	var action_pool:= {
		"Class": Action.new("Class", {
		"energy": 30,
		"time": 3,
		"academic": 20, 
		"wellbeing": -15, 
		"social": 0
		}),
		
		"Study": Action.new("Study", {
		"energy": 15,
		"time": 2,
		"academic": 10, 
		"wellbeing": -5, 
		"social": -5
		}),
		
		"Homework": Action.new("Homework", {
		"energy": 10,
		"time": 2,
		"academic": 5, 
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
		
		"Alone_Time": Action.new("Alone Time", {
		"energy": 10,
		"time": 2,
		"academic": -5, 
		"wellbeing": 10, 
		"social": -10
		}),
	}

#saturday and its task
func saturday():
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
	}




#start the day
func new_day():
	current_day += 1
	#add code to reset character
	planned_actions.clear()
	generate_actions()

#once actions are confirmed, this will calculate the new status
func calculate_actions():
	#applied selected actions
	for action in planned_actions:
		for stat in action.effects:
			PlayerStatus.change_stats(stat, action.effects[stat])
		print("Executed: ", action.name)
	calculate_energy()
	planned_actions.clear()

#get the new sleep to calculate new energy
func calculate_energy():
	var total_sleep: int = 0
	#add the sleep burden from choosen actions
	for actions in planned_actions:
		if "sleep" in actions.effects:
			total_sleep += actions.effects["sleep"]
	var final_sleep = 24 - total_sleep
	
	#calculates energy with Ethan's algorithm
	var new_energy: int = 0
	for i in range(final_sleep):
		if i < 4:
			new_energy += 7
		elif i < 9:
			new_energy += 10
		else:
			new_energy += 5
	
	#adds the multiplier based on wellbeing 
	#low wellbeing -> 0.8x
	#mid wellbeing -> 1.0x
	#high wellbeing -> 1.1x
	var wellbeing = PlayerStatus.wellbeing
	if wellbeing < 25:
		new_energy *= 0.8
	elif wellbeing < 75:
		new_energy *= 1
	else:
		new_energy *= 1.1
	return int(new_energy)
	

func get_planned_stat_changes() -> Dictionary:
	var total_changes: Dictionary = {}
	for action in planned_actions:
		for stat in action.effects:
			if not total_changes.has(stat):
				total_changes[stat] = 0
			total_changes[stat] += action.effects[stat]
	return total_changes

func calculate_stu():
	#if 0 - defualt
	#if 1 - happy
	#if 2 - shrimpin
	#if 3 - crashing out
	#if 4 - normal
	#if 5 - nerd
	#if 6 - tired
	var stu_status: int = 4;
	if (PlayerStatus.academic < 25):
		stu_status = 2
	if(PlayerStatus.academic > 75):
		stu_status = 5
	if(PlayerStatus.wellbeing < 25):
		stu_status = 3
	if(PlayerStatus.wellbeing > 75):
		stu_status = 1
	if(PlayerStatus.social < 25):
		stu_status = 6
	if(PlayerStatus.social > 75):
		stu_status = 1

func _ready():
	#Example usage
	#study()
	PlayerStatus.print_stats()

func pool_to_array() -> Array:
	sunday()
	print(action_pool)
	return action_pool.keys()
		

func study():
	PlayerStatus.change_stat("academic", 10)
