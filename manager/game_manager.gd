extends Node

##################################################
var game_over: bool = true	# 게임 오버 변수
var pipe_speed: float = 150.0	# 파이프 다가오는 속도
var pipe_interval: float = 2.0	# 파이프 생성 간격 시간
var pipe_gap: float = 150.0	# 위 아래 파이프 거리
var score: int = 0	# 점수

##################################################
func get_game_over() -> bool:
	return game_over

##################################################
func set_game_over(value: bool) -> void:
	game_over = value

##################################################
func get_pipe_speed() -> float:
	return pipe_speed

##################################################
func get_pipe_interval() -> float:
	return pipe_interval

##################################################
func get_pipe_gap() -> float:
	return pipe_gap

##################################################
func get_score() -> int:
	return score

##################################################
func set_score(value: int) -> void:
	score = value
