extends Node2D

func _on_bow_pressed():
	get_tree().change_scene_to_file("res://room one bow.tscn")
	

	
	





func _on_spear_pressed() -> void:
	get_tree().change_scene_to_file('res://room one spear.tscn')


func _on_sword_pressed() -> void:
	get_tree().change_scene_to_file("res://room one bow.tscn")
