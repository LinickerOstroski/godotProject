extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func atualiza_pontuacao(pontos):
	$pontuacao.text = "LIFE POINTS: " + str(pontos)	
	
func atualiza_coins(coins):
	$coins.text = "COINS: " + str(coins)	
