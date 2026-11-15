extends Area2D

var rng := RandomNumberGenerator.new()
var direction_x: int
var direction_y: int
const SPEED: int = 300

func _ready() -> void:
	direction_x = -1 if rng.randi_range(0,1) == 0 else 1
	direction_y = -1 if rng.randi_range(0,1) == 0 else 1

func _process(delta: float) -> void:
	position += Vector2(direction_x,direction_y) * (SPEED * delta)
	


func _on_body_entered(body: Node2D) -> void:
	print(body)
	if body == $"../../Walls/Top" or body == $"../../Walls/Bottom":
		direction_y = -direction_y
	if body == $"../../Paddle" or body == $"../../Paddle2":
		direction_x = -direction_x
	
	if body == $"../../Walls/Left":
		printt("Right Player Scored!!\nuse group here")
		get_tree().call_group("reset_game", "_spawn_ball")
		get_tree().call_group("reset_game", "_score","R")
	if body == $"../../Walls/Right":
		printt("Left Player Scored!!\nuse group here")
		get_tree().call_group("reset_game", "_spawn_ball")
		get_tree().call_group("reset_game", "_score","L")
