extends KinematicBody2D

onready var animatedSprite = $AnimatedSprite

var isinCombo = false

var timeTillNextInput = 0.5
var time = 0
# var b = "text"
var currentAttack = 0
var previousAttack = 0

func _ready():
	time = timeTillNextInput


func _process(delta):
	if(Input.is_action_just_pressed("ui_punch")):
		if(currentAttack == 0):
			animatedSprite.play("Straight Punch")
		elif(currentAttack == 1):
			animatedSprite.play("Upper cut")
		elif(currentAttack == 2):
			animatedSprite.play("low kick")

		isinCombo = true
		currentAttack += 1

	if(isinCombo):
		time -= delta
		
		
		if(time < 0):
			time = timeTillNextInput
			isinCombo = false
			currentAttack = 0
			animatedSprite.play("Idle")
			
			
			
func _Reset_Attack_Timer():
	if(currentAttack < 4):
		time = timeTillNextInput
