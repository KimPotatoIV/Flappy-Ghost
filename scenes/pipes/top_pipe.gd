extends Area2D

##################################################
const FREE_LINE: float = -200.0	# Pipe를 삭제하는 X 좌표
const SCORE_LINE: float = 40.0	# Score 올려주는 X 좌표

var score_check = false	# Score 중복 추가를 막기 위한 변수

##################################################
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	# body 충돌 시 _on_body_entered 함수 연결

##################################################
func _process(delta: float) -> void:
	position.x -= GameManager.get_pipe_speed() * delta	# Pipe 좌측으로 이동
	
	if position.x <= SCORE_LINE and !score_check and !GameManager.get_game_over():
		GameManager.set_score(GameManager.get_score() + 1)
		score_check = true
		# Pipe를 삭제하는 X 좌표를 지나고 score_check가 false이고 게임 오버가 아닐 때
		# Score 추가
	elif position.x <= FREE_LINE:
		score_check = false
		queue_free()
		# score_check 변수 초기화 후 Pipe 삭제

##################################################
func _on_body_entered(body: Node2D):
	if body.is_in_group("Ghost"):	# 충돌 그룹이 Ghost라면
		GameManager.set_game_over(true)	# 게임 오버
