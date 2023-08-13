extends Control
class_name Minigame


var sword_rotation := 0.0
var rotation_clockwise := false


enum GameResult {VICORY, DEFEAT, DRAW}


signal game_end(result: GameResult)


func _process(delta: float) -> void:
	if rotation_clockwise:
		sword_rotation += delta
	else:
		sword_rotation -= delta
	if rotation_clockwise and sword_rotation >= 0.3 or (not rotation_clockwise) and sword_rotation <= -0.3:
		rotation_clockwise = not rotation_clockwise
	($TextureRect.material as ShaderMaterial).set_shader_parameter("rotation", sword_rotation)
