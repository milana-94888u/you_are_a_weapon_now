extends Control
class_name Minigame


var sword_rotation := 0.0
var rotation_clockwise := false


enum GameResult {VICTORY, DEFEAT, DRAW}


signal game_end(result: GameResult)


func _process(delta: float) -> void:
	$TextureProgressBar.value = $Timer.time_left
	if rotation_clockwise:
		sword_rotation += delta
	else:
		sword_rotation -= delta
	if rotation_clockwise and sword_rotation >= 0.3 or (not rotation_clockwise) and sword_rotation <= -0.3:
		rotation_clockwise = not rotation_clockwise
	($Player.material as ShaderMaterial).set_shader_parameter("rotation", sword_rotation)


func end_game() -> void:
	set_process(false)
	randomize()
	if randi_range(0, 1):
		$Enemy.position = Vector2i(576, 172)
		$Enemy.flip_v = true
	else:
		$Enemy.position = Vector2i(552, 204)
		$Enemy.flip_v = false
	$Enemy.visible = true
	await get_tree().create_timer(2).timeout
	if $Enemy.flip_v == ((sword_rotation < 0) == rotation_clockwise):
		game_end.emit(GameResult.VICTORY)
	else:
		game_end.emit(GameResult.DEFEAT)


func _on_timer_timeout() -> void:
	game_end.emit(GameResult.DRAW)


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		remove_child($Timer)
		end_game()
