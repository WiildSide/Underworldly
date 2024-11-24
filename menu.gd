extends Node2D


func _on_quit_pressed() -> void:
	get_tree().quit()
	get_viewport().size = DisplayServer.screen_get_size()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://style_choice scene.tscn")


#func _on_fullscreen_toggled(button_pressed: bool) -> void:
	#if button_pressed == true:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		#get_viewport().size = DisplayServer.screen_get_size()
	#if button_pressed == false:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		#get_viewport().size = DisplayServer.screen_get_size()
