extends Node

export (Vector2) var direction

func do_command() -> void:
	get_parent().position += direction * 64


func undo_command() -> void:
	get_parent().position -= direction * 64
	queue_free()

