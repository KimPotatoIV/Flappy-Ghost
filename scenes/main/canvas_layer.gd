extends CanvasLayer

##################################################
@onready var start_label: Label = $StartLabel	# 시작 안내 라벨
@onready var score_label: Label = $MarginContainer/ScoreLabel	# Score 라벨
@onready var ghost = $"../Ghost"	# 플레이어(Ghost)
var game_score	# Score 변경 확인을 위한 변수

##################################################
func _ready() -> void:
	start_label.visible = true	# 시작 안내 라벨 보이기
	game_score = GameManager.get_score()	# 변수 초기화

##################################################
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and GameManager.get_game_over():
		GameManager.set_game_over(false)
		start_label.visible = false
		GameManager.set_score(0)
		# 게임 오버 시 스페이스를 누르면 시작 안내 라벨 가리고 Score 초기화
		
	if GameManager.get_game_over() == true:
		start_label.visible = true
		ghost.global_position.y = 320
		ghost.velocity.y = 0	# 플레이어 하락 속도 초기화
		# 게임 오버 시 시작 안내 라벨 보이고 플레이어 초기화
	
	if game_score != GameManager.get_score():
		score_label.text = "SCORE " + str(GameManager.get_score()).pad_zeros(3)
		game_score = GameManager.get_score()
		# game_score 변수가 실제 score와 차이가 있을 때만
		# Score 라벨 수정
