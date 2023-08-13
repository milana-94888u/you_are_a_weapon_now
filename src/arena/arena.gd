extends Node2D


var minigame_scene := preload("res://src/minigames/sword_bending_minigame.tscn")


func _ready() -> void:
	$Player.play("idle")
	$Enemy.play("idle")
	await $CanvasLayer/Captions.captions_end
	$CanvasLayer.remove_child($CanvasLayer/Captions)
	$AnimationPlayer.play("clash_swords")


# Animation loop
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "clash_swords":
		var minigame: Minigame = minigame_scene.instantiate()
		$CanvasLayer.add_child(minigame)
		match await minigame.game_end:
			Minigame.GameResult.VICTORY:
				$Enemy/ProgressBar.value -= 1
				$AnimationPlayer.play("clash_swords_player_win")
			Minigame.GameResult.DEFEAT:
				$Player/ProgressBar.value -= 1
				$AnimationPlayer.play("clash_swords_enemy_win")
			Minigame.GameResult.DRAW:
				$AnimationPlayer.play("clash_swords_retreat")
		$CanvasLayer.remove_child(minigame)
		if $Enemy/ProgressBar.value == 0 or $Player/ProgressBar.value == 0:
			get_tree().reload_current_scene()
	else:
		$AnimationPlayer.play("clash_swords")
