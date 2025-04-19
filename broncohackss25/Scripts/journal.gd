extends Control

signal day_over

@onready var transition = $Transition
@onready var energy_label: Label = $Label3
var out_of_energy = false

func _ready():
	transition.play("fade_in")
	SignalBus.energy_changed.connect(on_energy_changed)

func _on_button_pressed() -> void:
	#set_modulate(lerp(get_modulate(), Color(0,0,0,1), 0.2))
	day_over.emit()
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func on_energy_changed(amt):
	var energy = int(energy_label.text.substr(8))
	energy += amt
	
	if energy > 50:
		energy = 50
	if energy <= 0:
		energy = 0
		out_of_energy = true
		SignalBus.energy_depleted.emit()
	if energy > 0 and out_of_energy:
		SignalBus.energy_restored.emit()
	
	energy_label.text = "Energy: " + str(energy)
