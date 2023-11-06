extends KinematicBody2D

var velocidade_movimento = 100
var pontos_heroi = 100
var esta_atacando = false
var esta_morto = false  # Flag para verificar se o personagem está morto
onready var hud = get_node("/root/Mundo/HUD")
onready var portal = get_node("/root/Mundo/Portal")

# Chamado quando o nó entra na árvore da cena pela primeira vez.
func _ready():
	hud.atualiza_pontuacao(pontos_heroi)

func _physics_process(delta):
	# Não executa nenhuma ação se o personagem está morto
	if esta_morto:
		return

	var movimento = Vector2()

	# Permite o movimento se o personagem não estiver atacando ou morto
	if not esta_atacando:
		# Verifica movimento horizontal
		if Input.is_action_pressed("ui_right"):
			movimento.x = velocidade_movimento
			$AnimatedSprite.flip_h = false
		elif Input.is_action_pressed("ui_left"):
			movimento.x = -velocidade_movimento
			$AnimatedSprite.flip_h = true
		
		# Verifica movimento vertical
		if Input.is_action_pressed("ui_down"):
			movimento.y = velocidade_movimento
		elif Input.is_action_pressed("ui_up"):
			movimento.y = -velocidade_movimento
		
		# Define a animação com base no movimento
		var animacao = "parado"
		if movimento.x != 0 and movimento.y == 0:
			animacao = "andando"
		elif movimento.y > 0:
			animacao = "andando_baixo"
		elif movimento.y < 0:
			animacao = "andando_cima"
		
		# Move o personagem e toca a animação correspondente
		movimento = move_and_slide(movimento)
		if $AnimatedSprite.animation != animacao and not esta_atacando:
			$AnimatedSprite.play(animacao)

	# Verifica se o personagem está atacando
	if Input.is_action_just_pressed("ui_select") and not esta_atacando:
		atacar()

	# Verifica a proximidade do portal
	is_portal_perto()

func atacar():
	esta_atacando = true
	$AnimatedSprite.play("atacando")
	yield($AnimatedSprite, "animation_finished")
	esta_atacando = false

func is_portal_perto():
	var dist = position.distance_to(portal.position)
	if dist < 70:
		get_tree().change_scene("res://Mundo2.tscn")

func toma_dano(dano):
	if esta_morto:  # Se o personagem já estiver morto, ignora o dano adicional
		return
	
	pontos_heroi -= dano
	hud.atualiza_pontuacao(pontos_heroi)

	# Executa a animação de morte e troca de cena quando a vida chega a zero
	if pontos_heroi <= 0 and not esta_morto:
		esta_morto = true
		$AnimatedSprite.play("morrendo")
		yield($AnimatedSprite, "animation_finished")
		get_tree().change_scene("res://Mundo.tscn")
