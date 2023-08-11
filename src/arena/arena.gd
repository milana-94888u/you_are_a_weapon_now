extends Node2D


func _ready() -> void:
	$AnimationPlayer.play("fight")


# Animation loop
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$AnimationPlayer.play(anim_name)
