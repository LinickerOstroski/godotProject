extends KinematicBody2D

var movimento = Vector2()
var pontosHeroi = 100
onready var hud = get_node("/root/Mundo/HUD")
onready var portal = get_node("/root/Mundo/Portal")
onready var alvo = get_node("/root/Mundo/Inimigo4")

# Called when the node enters the scene tree for the first time.
func _ready():
	hud.atualizaPontuacao(pontosHeroi)

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		movimento.x = 150
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		movimento.x = -150
		$AnimatedSprite.play("andando")
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_down"):
		movimento.y = 150
		$AnimatedSprite.play("andando")
	elif Input.is_action_pressed("ui_up"):
		movimento.y = -150
		$AnimatedSprite.play("andando")
	else:
		movimento.x = 0
		movimento.y = 0
		$AnimatedSprite.play("parado")
		
	if Input.is_action_pressed("ui_select"):
		$AnimatedSprite.play("atacando")
		
	movimento = move_and_slide(movimento)
	isPortalPerto()
	#movimento = move_and_slide_with_snap(movimento)
	
func isPortalPerto():
	var dist = position.distance_to(portal.position)
	if(dist<70):
		get_tree().change_scene("res://Mundo2.tscn")
		print("potal")
	
func toma_dano(dano):
	pontosHeroi -= dano
	hud.atualizaPontuacao(pontosHeroi)
	
	if pontosHeroi <= 0:
		$AnimatedSprite.play("morrendo")
		get_tree().change_scene("res://Mundo.tscn")
		
	print("pontos do Heroi:",pontosHeroi)
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
