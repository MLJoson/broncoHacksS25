extends VBoxContainer

@export var PlayerStatus: PlayerStatus
@export var stat_name: String #"academic", "wellbeing", "social" 
@onready var acad_bar: ProgressBar = $Academic/Bar
@onready var stress_bar: ProgressBar = $Stress/Bar
@onready var social_bar: ProgressBar = $Social/Bar

func _ready() -> void:
	update_bar()

func _process(delta: float) -> void:
	if PlayerStatus == null:
		return
	match stat_name:
		"academic":
			acad_bar.value = PlayerStatus.academic
		"social":
			stress_bar.value = PlayerStatus.social
		"wellbeing":
			social_bar.value = PlayerStatus.wellbeing

func update_bar():
	pass
