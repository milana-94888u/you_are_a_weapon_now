extends AnimatedSprite2D


#@export var current_animation: StringName = animation


#func _set(property: StringName, value: Variant) -> bool:
#	if property == "animation":
#		animation = value
#		print("aaa")
#	return true


func _ready() -> void:
	play("idle")
