extends Area2D

##################################################
const FREE_LINE: float = -200.0	# Pipe를 삭제하는 X 좌표

##################################################
func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	# body 충돌 시 _on_body_entered 함수 연결

##################################################
func _process(delta: float) -> void:
	position.x -= GameManager.get_pipe_speed() * delta	# Pipe 좌측으로 이동
	
	if position.x <= FREE_LINE:
		queue_free()	# 삭제하는 X 좌표를 지나면 삭제

##################################################
func _on_body_entered(body: Node2D):
	if body.is_in_group("Ghost"):	# 충돌 그룹이 Ghost라면
		GameManager.set_game_over(true)	# 게임 오버
		GameManager.play_game_over_sound()	# 게임 오버 사운드 재생
