extends Sprite2D

##################################################
@onready var moving_background_1: Sprite2D = $House1	# 움직이는 배경 1번
@onready var moving_background_2: Sprite2D = $House2	# 움직이는 배경 2번

const RESET_POSITION: float = 720.0	# 배경이 시작하는 X 좌표
const OFFSCREEN_POSITION: float = -720.0	# 배경이 초기화 되는 X 좌표

var moving_speed: float = 50.0	# 배경 움직임 속도

##################################################
func _process(delta: float) -> void:
	moving_background_1.position.x -= delta * moving_speed
	moving_background_2.position.x -= delta * moving_speed
	# 배경 1번과 2번을 우측에서 좌측으로 움직임
	
	reset_background_position(moving_background_1)
	reset_background_position(moving_background_2)
	# 배경을 초기화 좌표에 따라 시작 좌표로 이동

##################################################
func reset_background_position(value: Sprite2D) -> void:
	if value.position.x <= OFFSCREEN_POSITION:	# 초기화 좌표까지 배경이 벗어나면
		value.position.x = RESET_POSITION	# 시작 좌표로 초기화
