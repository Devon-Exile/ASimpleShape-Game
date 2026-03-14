extends CanvasLayer 

@onready var health_label: Label = $Health
@onready var player = get_tree().get_first_node_in_group("player")  

func _ready() -> void:
	player.health_changed.connect(_on_health_changed)
	health_label.text = "HP: " + str(player.health) 

func _on_health_changed(new_health: int) -> void:
	health_label.text = "HP: " + str(new_health)
