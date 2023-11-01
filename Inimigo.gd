extends KinematicBody2D

#Velocidade do inimigo (considere a velocidade que vc colocou no player)
var speed = 100

#xp que o usuário ganha ao matar o inimigo
#Se quiser usar, crie o método de pontuação no player
# no nosso exemplo, contamos o tempo de vida do player e os pontos
# servem apenas para definir quando ele morre
#var xp = 20

#dano que o inimigo gera ao usuário
var dano = 5

#Tempo de ataque (ele não pode ter ataques sucesivos)
# ele terá um ataque pelo tempo que estiver definido abaixo:
#  1.0: 1 segundo
#  0.5: 500 milésimos de segundo
#  0.2: 200 milésimos de segundo
# etc
var tataque = 0.2

#distancia de ataque
# Não pode ficar muito curta, senão o inimigo não consegue chegar muito perto
# Não pode ficar muito longa, senão o inimigo ataca de longe e não encurrala o inimigo
var dataque = 60

#distância de perseguição
# se eu chegar em uma certa distância o inimigo nos perseguirá
# No caso, considere o tamanho do cenário. Com 1000, o inimigo irá perseguir o
# player por todo o cenário.
var dpers = 200

#facilitador para trabalhar com o timer
onready var timer = $Timer

#facilitador para trabalhar com o player (pegar o que está carregado na cena Main)
onready var alvo = get_node("/root/Mundo/Heroi")

func _ready():
	timer.wait_time = tataque
	timer.start()

#process é chamada 60 vezes por segundo
func _physics_process(delta):
	var dist = position.distance_to(alvo.position)
	if dist > dataque and dist < dpers:
		#fiz uma linha reta do centr do inimigo ao centro do player
		# a menor distância é uma reta. Por isso usamos o normalized
		var vel = (alvo.position - position).normalized()
		move_and_slide(vel * speed)
		
	if(dist<70 && Input.is_action_pressed("ui_select")):
		atacar()
	
func atacar():	
	morre()
	
#quando o time disparar. 1 em 1 segundos
func _on_Timer_timeout():
	# Se eu estou a menos q a distância de ataque, o inimigo gera dano no player
	var dist2 = position.distance_to(alvo.position)
	if dist2 <= dataque:
		alvo.toma_dano(dano)

func morre():	
	#excluo este nó e o inimigo desaparece
	queue_free()
