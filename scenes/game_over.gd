extends CanvasLayer

func _ready():
	$CenterContainer/VBoxContainer/Score.text = $CenterContainer/VBoxContainer/Score.text + str(Global.score)
	
func _process(delta: float) -> void:
	# Start new game on spacebar
	if Input.is_action_just_pressed("new_game"):
		get_tree().change_scene_to_file("res://scenes/level.tscn")
