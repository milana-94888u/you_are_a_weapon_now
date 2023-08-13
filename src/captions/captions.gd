extends Control
class_name Captions


signal captions_end


@export var lines := [
	"You became just a sword",
	"You can't do anything",
	"Only bend yourself",
]


func _on_timer_timeout() -> void:
	if lines:
		$Label.text = lines.pop_front()
	else:
		$Timer.stop()
		captions_end.emit()
