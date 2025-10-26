extends Area2D

@export var speed = 500

func _process(delta):
	position.y -= speed * delta
