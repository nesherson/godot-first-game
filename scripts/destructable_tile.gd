extends StaticBody2D

@onready var collision_shape = $CollisionShape2D
@onready var trigger_area = $TriggerArea 
@onready var tile_destruction_timer = $TileDestructionTimer
@onready var tile_revival_timer = $TileRevivalTimer
@onready var sprite = $Sprite2D

var timer_tick_limit := 3
var timer_tick_count := 0

func _on_body_entered(body: Node2D) -> void:
	tile_destruction_timer.start(1)

func _on_tile_destruction_timer_timeout() -> void:
	if timer_tick_count >= 3:
		tile_destruction_timer.stop()
		tile_revival_timer.start(3)
	
	timer_tick_count += 1
	sprite.self_modulate.a -= 0.33
	
	if collision_shape.disabled == false:
		collision_shape.disabled = true
		trigger_area.monitoring = false
	
	print(tile_destruction_timer.time_left)
	
func _on_tile_revival_timer_timeout() -> void:
	sprite.self_modulate.a = 1
	collision_shape.disabled = false
	trigger_area.monitoring = true
	timer_tick_count = 0
	tile_revival_timer.stop()
	
	
	
