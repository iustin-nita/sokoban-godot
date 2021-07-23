extends StaticBody


var dir: = Vector3.ZERO
var old_dir:= Vector3.ZERO
var is_moving:= false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta: float) -> void:
	dir = Vector3.ZERO
	if Input.is_action_just_pressed("ui_up"): dir = Vector3.BACK
	if Input.is_action_just_pressed("ui_down"): dir = Vector3.FORWARD
	if Input.is_action_just_pressed("ui_left"): dir = Vector3.RIGHT
	if Input.is_action_just_pressed("ui_right"): dir = Vector3.LEFT
	
	if dir!= Vector3.ZERO:
		movement(dir)
		print(dir)

func movement(vec: Vector3)->void:
	if is_moving == false:
		is_moving = true
		var translation_vector := translation
		var wanted_position := translation_vector + vec * 2
		$TweenMovement.interpolate_property(self, "translation", translation_vector, wanted_position, 1.0, Tween.TRANS_EXPO, Tween.EASE_OUT)
		$TweenMovement.start()
		yield($TweenMovement, "tween_all_completed") # wait
		is_moving = false
