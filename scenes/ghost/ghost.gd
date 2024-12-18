extends CharacterBody2D

##################################################
const JUMP_VELOCITY: float = -300.0	# 점프 강도
const MIN_Y_POSITION: float = 0.0	# 상단 게임 오버 Y 좌표
const MAX_Y_POSITION: float = 620.0	# 하단 게임 오버 Y 좌표

##################################################
func _physics_process(delta: float) -> void:
	if GameManager.game_over == false:
		velocity += get_gravity() * delta	# 중력 적용
		
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = JUMP_VELOCITY
			# 스페이스를 누르면 중력과 반대 방향으로 점프
			
	move_and_slide()
	
	if global_position.y <= MIN_Y_POSITION or global_position.y >= MAX_Y_POSITION:
		GameManager.game_over = true
		# 게임 오버 상하단 좌표 이상으로 벗어나면 게임 오버
