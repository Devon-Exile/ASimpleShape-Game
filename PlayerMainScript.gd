extends CharacterBody2D

const COLORS = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW]
const speed := 300.0
const radius := 32.0
var color : Color
var score: int = 0

signal health_changed(new_health: int)
var health: int = 3

func _ready() -> void:
	$CollisionShape2D.shape.radius = radius
	set_color()

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)

func set_color() -> void:
	color = COLORS[randi() % COLORS.size()]
	queue_redraw()  

func get_color() -> Color:
	return color

func add_score(amount: int):
	score += amount

func take_damage(amount: int):
	health -= amount
	emit_signal("health_changed", health)
	get_tree().get_first_node_in_group("camera").shake(10.0)
	if health == 0:
		queue_free()

func _physics_process(delta: float) -> void:
	var y := Input.get_axis("Up", "Down")
	var x := Input.get_axis("Left", "Right")
	var direction := Vector2(x, y)
	velocity = direction.normalized() * speed 
	move_and_slide()

	var target_scale := Vector2.ONE
	if abs(x) > abs(y):
		target_scale = Vector2(1.15, 0.85)
	elif abs(y) > abs(x):
		target_scale = Vector2(0.85, 1.15)
	scale = scale.lerp(target_scale, 10.0 * delta)

func _on_color_timer_timeout() -> void:
	set_color()  
