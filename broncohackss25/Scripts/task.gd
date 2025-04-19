extends HBoxContainer

@onready var check_box: CheckBox = $CheckBox
@onready var label: Label = $Label

func _on_check_box_pressed() -> void:
	check_box.disabled = true

func change_task_name(task_name : String) -> void:
	label.text = task_name
