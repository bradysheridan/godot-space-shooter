extends Node2D

var num_stars = 40
var star_scene: PackedScene = load("res://scenes/star.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var size = get_viewport().get_visible_rect().size
	for i in num_stars:
		var star = star_scene.instantiate()
		var x = randi_range(0, size.x)
		var y = randi_range(0, size.y)
		star.position = Vector2(x, y)
		var scale_x = randf_range(0.2, 0.65)
		var scale_y = scale_x
		star.scale = Vector2(scale_x, scale_y)
		star.play("", randf_range(0, 1))
		self.add_child(star)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
