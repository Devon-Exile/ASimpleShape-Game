extends Camera2D

var shakeIntesity: float = 0.0
const decay: float = 2.0  

func shake(intensity: float) -> void:
	shakeIntesity = intensity

func _process(delta: float) -> void:
	if shakeIntesity > 0:
		shakeIntesity = lerp(shakeIntesity, 0.0, decay * delta)
		offset = Vector2(
			randf_range(-shakeIntesity, shakeIntesity),
			randf_range(-shakeIntesity, shakeIntesity)
		)
	else:
		offset = Vector2.ZERO
