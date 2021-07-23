extends Spatial

var water_height:= 1.5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$water.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$water.translation.y = lerp($water.translation.y, water_height, 0.15)  # smooth

func _on_Timer_timeout() -> void:
	randomize()
	water_height = rand_range(1.4, 2.0)
	$Timer.wait_time = rand_range(0.1, 0.6)

