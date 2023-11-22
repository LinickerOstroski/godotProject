extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var novaMoeda = preload("res://Coins.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	print ("executou")
	var Moeda1 = novaMoeda.instance()
	var Moeda2 = novaMoeda.instance()
	
	
	add_child(Moeda1)
	add_child(Moeda2)
	Moeda1.position.x = 366
	Moeda1.position.y = 751
	
	Moeda2.position.x = 18
	Moeda2.position.y = 623
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
