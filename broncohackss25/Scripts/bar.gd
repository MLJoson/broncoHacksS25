extends ProgressBar

#Connect to player_status file
@export var PlayerStatus: PlayerStatus
@export var stat_name: String #"academic", "wellbeing", "social" 

#one start
func _ready() -> void:
	value = 100 #placeholder
	update_bar()

func update_bar():
	if PlayerStatus == null:
		return
	match stat_name:
		"academic":
			value = PlayerStatus.academic
		"social":
			value = PlayerStatus.social
		"wellbeing":
			value = PlayerStatus.wellbeing
		_:
			value = 0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("increase_val"):
		value += 20
	if Input.is_action_just_pressed("decrease_val"):
		value -= 20
	update_bar()

func _on_value_changed(value: float) -> void:
	get("theme_override_styles/fill").bg_color = Color.from_hsv(0.3 * (value / 100.0), 0.9, 0.7)
