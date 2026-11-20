extends Area2D

signal berhasil_diselamatkan

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerAli":
		berhasil_diselamatkan.emit()
