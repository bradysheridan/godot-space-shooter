extends CanvasLayer

static var life_image = load('res://graphics/ui/playerLife1_red.png')
var time_elapsed := 0

func set_health(amount):
	# Remove all children
	for child in $Life/HBoxContainer.get_children():
		child.queue_free()

	# Create 1 new child per health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture = life_image
		$Life/HBoxContainer.add_child(text_rect)
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED

func _on_score_timer_timeout() -> void:
	time_elapsed += 1
	$Score/Label.text = str(time_elapsed)
	Global.score = time_elapsed
