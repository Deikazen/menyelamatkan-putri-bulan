extends CharacterBody2D

signal hp_berubah(nilai_hp: int)
signal pemain_kalah

const SPEED = 260.0
const JUMP_VELOCITY = -420.0

var hp: int = 3
var daya_tameng: float = 100.0
var tameng_aktif: bool = false

@onready var tameng_visual: Area2D = $TamengVisual
@onready var tameng_collider: CollisionShape2D = $TamengVisual/CollisionShape2D
@onready var bar_tameng: ProgressBar = $BarDayaTahanTameng

func _ready() -> void:
	tameng_visual.visible = false
	tameng_collider.disabled = true
	bar_tameng.value = daya_tameng

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Lompat (Spasi / W / Panah Atas)
	if (Input.is_action_just_pressed("ui_accept") or Input.is_key_pressed(KEY_W) or Input.is_action_just_pressed("ui_up")) and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Gerak Kiri / Kanan (A & D atau Panah Kiri & Kanan)
	var arah := 0.0
	if Input.is_key_pressed(KEY_A) or Input.is_action_pressed("ui_left"):
		arah -= 1.0
	if Input.is_key_pressed(KEY_D) or Input.is_action_pressed("ui_right"):
		arah += 1.0

	velocity.x = arah * SPEED if arah != 0.0 else move_toward(velocity.x, 0, SPEED)

	# Aktifkan Tameng (Tahan S / Panah Bawah / Shift)
	if (Input.is_key_pressed(KEY_S) or Input.is_action_pressed("ui_down") or Input.is_key_pressed(KEY_SHIFT)) and daya_tameng > 0:
		tameng_aktif = true
		daya_tameng = max(0.0, daya_tameng - 25.0 * delta)
	else:
		tameng_aktif = false
		daya_tameng = min(100.0, daya_tameng + 15.0 * delta)

	tameng_visual.visible = tameng_aktif
	tameng_collider.disabled = not tameng_aktif
	bar_tameng.value = daya_tameng

	move_and_slide()

func terima_damage(jumlah: int = 1) -> void:
	hp = max(0, hp - jumlah)
	hp_berubah.emit(hp)
	if hp <= 0:
		pemain_kalah.emit()
