extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("upward2") and Input.is_action_pressed("downward2"):
		return
	elif Input.is_action_pressed("upward2"):
		self.velocity = Vector2(0,-70000)*delta
	elif Input.is_action_pressed("downward2"):
		self.velocity = Vector2(0,70000)*delta
	move_and_slide()
	self.velocity = Vector2.ZERO
