extends Area2D

@export var kecepatan: float = 200.0

func _ready() -> void:
	area_entered.connect(_on_area_entered)
	body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
	position.x -= kecepatan * delta # Bergerak dari kanan ke kiri

func _on_area_entered(area: Area2D) -> void:
	if area.name == "TamengVisual":
		queue_free() # Terblokir tameng Ali

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("terima_damage"):
		body.terima_damage(1)
		queue_free()
