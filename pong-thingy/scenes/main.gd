extends Node2D

var ball := load("res://scenes/ball.tscn")
var LScore : int = 0
var RScore : int = 0

func _score(point_to: String = ""):
	if point_to == "L":
		LScore += 1
		$ScoreElements/LPlayer.text = str(LScore)
	elif point_to == "R":
		RScore += 1
		$ScoreElements/RPlayer.text = str(RScore)

func _spawn_ball():
	# If BallContainer has children: delete children
	if len($BallContainer.get_children()) == null:
		for i in len($BallContainer.get_children()):
			$BallContainer.get_child(i).queue_free()
	
	# Create Instance of ball, add to scene tree, set position
	var ball_ins = ball.instantiate()
	$BallContainer.call_deferred("add_child", ball_ins)
	ball_ins.global_position = Vector2(500,500)

func _ready() -> void:
	_spawn_ball()

func _process(_delta: float) -> void:
	pass
