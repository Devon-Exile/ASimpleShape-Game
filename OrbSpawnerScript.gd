extends Node2D

@export var orb_scene: PackedScene
@export var spawn_margin: float = 32.0
var screen_size: Vector2

func _ready():
	screen_size = get_viewport().get_visible_rect().size
	$Timer.timeout.connect(_on_timer_timeout)

func _on_timer_timeout():
	spawn_orb()

func spawn_orb():
	if get_child_count() >= 10:
		return
	var orb = orb_scene.instantiate()
	orb.position = get_random_position()
	add_child(orb)

func get_random_position() -> Vector2:
	var x = randf_range(spawn_margin, screen_size.x - spawn_margin)
	var y = randf_range(spawn_margin, screen_size.y - spawn_margin)
	return Vector2(x, y)
