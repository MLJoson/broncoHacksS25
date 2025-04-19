extends ProgressBar

func _ready() -> void:
	value = 100

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("increase_val"):
		value += 20
	if Input.is_action_just_pressed("decrease_val"):
		value -= 20

func _on_value_changed(value: float) -> void:
	get("theme_override_styles/fill").bg_color = Color.from_hsv(0.3 * (value / 100.0), 0.9, 0.7)
