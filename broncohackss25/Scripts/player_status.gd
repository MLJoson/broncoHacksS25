extends Node

class_name PlayerStatus

#Player status variables
var academic: int = 60
var wellbeing: int = 100
var social: int = 60
var energy: int = 50
var time: int = 24

#Status min max
const MAX_STAT = 100
const MIN_STAT = 0

#changes status 
func change_stats(stat: String, amount: int) -> void:
	match stat:
		"academic":
			academic = clamp(academic + amount, MIN_STAT, MAX_STAT)
		"wellbeing":
			wellbeing = clamp(wellbeing + amount, MIN_STAT, MAX_STAT)
		"social":
			social = clamp(social + amount, MIN_STAT, MAX_STAT)
		"energy":
			energy = clamp(energy + amount, MIN_STAT, MAX_STAT)
		"time":
			time = clamp(time + amount, MIN_STAT, 24)

#print status
func print_stats() -> void:
	print("Academic: ", academic)
	print("Wellbeing: ", wellbeing)
	print("Social: ", social)
	print("Energy: ", energy)
	print("Time: ", time)
