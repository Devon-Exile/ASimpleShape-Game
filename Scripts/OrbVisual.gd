extends Node2D

func _draw():
	var orb_color = get_parent().orb_color
	draw_circle(Vector2.ZERO, 16.0, orb_color)
	draw_arc(Vector2.ZERO, 16.0, 0, TAU, 32, Color.WHITE, 2.0)
