extends Node2D

##################################################
@onready var spawn_timer: Timer = $Timer	# 파이프 생성 간격 타이머
var pipes: Array = []	# 게임 오버 시 파이프 삭제를 위한 배열

##################################################
func _ready() -> void:
	spawn_timer.wait_time = GameManager.get_pipe_interval()	# 타이머 간격 설정
	spawn_timer.connect("timeout", Callable(self, "_on_spawn_timer_timeout"))
	# timeout 시 _on_spawn_timer_timeout 함수 연결
	spawn_timer.start()
	# 타이머 재시작

##################################################
func _process(delta: float) -> void:
	if GameManager.get_game_over() and !pipes.is_empty():
		clear_pipes()
		# 게임 오버이면서 파이프가 empty가 아닐 때 함수 실행

##################################################
func _on_spawn_timer_timeout() -> void:
	if GameManager.game_over == false:
		spawn_pipes()
		# 게임 오버가 아닐 시 파이프 생성

##################################################
func spawn_pipes() -> void:
	var top_pipe: Area2D = load("res://scenes/pipes/top_pipe.tscn").instantiate()
	var bottom_pipe: Area2D = load("res://scenes/pipes/bottom_pipe.tscn").instantiate()
	# 위 아래 파이프 각각 불러오기
	
	var spawn_y: float = randf_range(-640+ GameManager.get_pipe_gap(), -GameManager.get_pipe_gap() * 2)
	# 상단 파이프 생성 Y 좌표
	
	top_pipe.position = Vector2(560, spawn_y)
	bottom_pipe.position = Vector2(560, spawn_y + 640 + GameManager.get_pipe_gap())
	# spawn_y 변수에 따라 상단 파이프 생성 후
	# GameManager의 pipe_gap 변수를 이용한 하단 파이프 생성 Y 좌표 설정
	
	add_child(top_pipe)
	add_child(bottom_pipe)
	
	pipes.append(top_pipe)
	pipes.append(bottom_pipe)
	# 게임 오버 시 삭제를 위한 등록

##################################################
func clear_pipes() -> void:
	if !pipes.is_empty():	# 파이프가 empty가 아닐 때
		for pipe in pipes:	# 파이프 배열을 반복하며
			if is_instance_valid(pipe):	# 유효한 pipe만
			# 파이프를 다른 곳에서도 지워주기 때문에 여기서 삭제 시 유효성 검사 필수
				pipe.queue_free()	# 삭제
	
	pipes.clear()	# 배열 정리
