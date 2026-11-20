extends Node2D

@onready var player: CharacterBody2D = $PlayerAli
@onready var putri_bulan: Area2D = $PutriBulan
@onready var label_hp: Label = $HUD/LabelHP
@onready var panel_hasil: Panel = $HUD/PanelHasil
@onready var label_status: Label = $HUD/PanelHasil/LabelStatus
@onready var tombol_ulang: Button = $HUD/PanelHasil/TombolUlang

func _ready() -> void:
	get_tree().paused = false
	panel_hasil.visible = false
	panel_hasil.process_mode = Node.PROCESS_MODE_ALWAYS

	player.hp_berubah.connect(_on_hp_berubah)
	player.pemain_kalah.connect(_on_pemain_kalah)
	putri_bulan.berhasil_diselamatkan.connect(_on_menang)
	tombol_ulang.pressed.connect(_on_ulang_pressed)

func _on_hp_berubah(nilai_hp: int) -> void:
	label_hp.text = "HP: " + str(nilai_hp)

func _on_pemain_kalah() -> void:
	label_status.text = "KALAH! Ali & Seli Terkena Serangan"
	panel_hasil.visible = true
	get_tree().paused = true

func _on_menang() -> void:
	label_status.text = "BERHASIL MENYELAMATKAN PUTRI BULAN!"
	panel_hasil.visible = true
	get_tree().paused = true

func _on_ulang_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
