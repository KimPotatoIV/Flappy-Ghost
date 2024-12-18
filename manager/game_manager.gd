extends Node

##################################################
var game_over: bool = true	# 게임 오버 변수
var pipe_speed: float = 150.0	# 파이프 다가오는 속도
var pipe_interval: float = 2.0	# 파이프 생성 간격 시간
var pipe_gap: float = 150.0	# 위 아래 파이프 거리
var score: int = 0	# 점수

var audio_player: AudioStreamPlayer = AudioStreamPlayer.new()
# 게임 오버 사운드 재생 플레이어

##################################################
func _ready() -> void:
	add_child(audio_player)
	audio_player.volume_db = -10
	# 게임 오버 사운드 재생을 위한 설정

##################################################
func play_game_over_sound() -> void:
	var game_over_sound = load("res://sounds/game_over.wav") as AudioStream
	audio_player.stream = game_over_sound
	audio_player.play()
	# 사운드를 로드 및 스트림 설정 후 재생하는 함수

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
