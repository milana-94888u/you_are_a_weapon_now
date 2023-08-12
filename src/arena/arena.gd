extends Node2D


func _ready() -> void:
	$AnimationPlayer.play("clash_swords")


# Animation loop
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "clash_swords":
		$AnimationPlayer.play("clash_swords_player_win")
	elif anim_name == "clash_swords_player_win":
		$AnimationPlayer.play("clash_swords")
