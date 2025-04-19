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

#the options player can choose
var action_pool:= {
	#Daily events
	"Attend_Class": Action.new("Attend Class", {
		"energy": 25,
		"time": 3,
		"academic": 10, 
		"wellbeing": 5, 
		"social": 0
	}),
	"Get_Food": Action.new("Get Food", {
		"energy": 10,
		"time": 1,
		"academic": 0, 
		"wellbeing": 5, 
		"social": 0
	}),
	"Chores": Action.new("Chores", {
		"energy": 10,
		"time": 1,
		"academic": 0, 
		"wellbeing": 5, 
		"social": -5
	}),
	
	#Major events
	"Exams": Action.new("Exams", {
		"energy": 20,
		"time": 1,
		"academic": 10, 
		"wellbeing": 5, 
		"social": -5
	}),
	"Quiz": Action.new("Quiz", {
		"energy": 10,
		"time": 1,
		"academic": 0, 
		"wellbeing": 5, 
		"social": 0
	}),
	
	#Minor events
	"Club_Meeting": Action.new("Club Meeting", {
		"energy": 10,
		"time": 1,
		"academic": -5, 
		"wellbeing": 5, 
		"social": 5
	}),
	"Acad_Club_Meeting": Action.new("Academic Club Meeting", {
		"energy": 10,
		"time": 1,
		"academic": 5, 
		"wellbeing": -5, 
		"social": 5
	}),
	"Study": Action.new("Study", {
		"energy": 10,
		"time": 2,
		"academic": 10, 
		"wellbeing": 0, 
		"social": -5
	}),
	"Office_Hours": Action.new("Office Hours", {
		"energy": 5,
		"time": 1,
		"academic": 10, 
		"wellbeing": 0, 
		"social": 2
	}),
	"Friend_Hangout": Action.new("Friend Hangout", {
		"energy": 20,
		"time": 3,
		"academic": -10, 
		"wellbeing": 10, 
		"social": 15
	}),
	"Alone_Time": Action.new("Alone Time", {
		"energy": 10,
		"time": 2,
		"academic": -10, 
		"wellbeing": 10, 
		"social": 0
	}),
	"Gym": Action.new("Gym", {
		"energy": 15,
		"time": 2,
		"academic": -10, 
		"wellbeing": 15, 
		"social": 0
	}),
}

func _ready():
	#Example usage
	study()
	PlayerStatus.print_stats()

func study():
	PlayerStatus.change_stat("academic", 10)
