extends Area2D

const COLORS = [Color.RED, Color.BLUE, Color.GREEN, Color.YELLOW]
const RADIUS = 16.0
var orb_color: Color

func _ready():
	orb_color = COLORS[randi() % COLORS.size()]
	$OrbVisual.queue_redraw()
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.has_method("get_color"):
		if body.get_color().is_equal_approx(orb_color):
			body.add_score(10)
		else:
			body.take_damage(1)
		queue_free()
