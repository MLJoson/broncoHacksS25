extends HBoxContainer

@onready var label: Label = $Label
@onready var check_box: CheckBox = $VBoxContainer/HBoxContainer/CheckBox

func _ready() -> void:
	SignalBus.energy_depleted.connect(_on_energy_depleted)
	SignalBus.energy_restored.connect(_on_energy_restored)

func change_task_name(task_name : String) -> void:
	label.text = task_name

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		SignalBus.energy_changed.emit(-10)
	else:
		SignalBus.energy_changed.emit(10)

func _on_energy_depleted():
	if check_box.toggle_mode == false:
		check_box.disabled = true

func _on_energy_restored():
	check_box.disabled = false
