extends Area2D

onready var Heroi = get_node("/root/Mundo/Heroi")
onready var hud = get_node("/root/Mundo/HUD")

# Called when the node enters the scene tree for the first time.
func _ready():
			
	pass # Replace with function body.
	

func _process(delta):
	var distancia = position.distance_to(Heroi.position)
	if distancia < 10:
		Heroi.coins_coletados += 1
		hud.atualiza_coins(Heroi.coins_coletados)
		queue_free()
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
