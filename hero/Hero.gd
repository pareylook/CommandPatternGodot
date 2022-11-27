extends Area2D

export (PackedScene) var command

func _physics_process(delta: float) -> void:
	# just check the input here
	if Input.is_action_just_pressed("move_up"):
		pass
	elif Input.is_action_just_pressed("move_down"):
		pass
	elif Input.is_action_just_pressed("move_right"):
		make_instance(Vector2.RIGHT)
	elif Input.is_action_just_pressed("move_left"):
		pass
	elif Input.is_action_just_pressed("undo"):
		undo_last_command()

func make_instance(direction) -> void:
	var command_instance = command.instance()
	command_instance.direction = direction
	self.add_child(command_instance)
	command_instance.do_command()
	
func undo_last_command() -> void:
	var temp_array = []
	for g in get_children():
		if g.is_in_group("command"):
			temp_array.append(g)
	if temp_array.size() != 0:
		temp_array[-1].undo_command()
