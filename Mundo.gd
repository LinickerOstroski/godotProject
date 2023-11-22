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
	var Moeda3 = novaMoeda.instance()
	var Moeda4 = novaMoeda.instance()
	var Moeda5 = novaMoeda.instance()
	var Moeda6 = novaMoeda.instance()
	var Moeda7 = novaMoeda.instance()
	var Moeda8 = novaMoeda.instance()
	
	add_child(Moeda1)
	add_child(Moeda2)
	add_child(Moeda3)
	add_child(Moeda4)
	add_child(Moeda5)
	add_child(Moeda6)
	add_child(Moeda7)
	add_child(Moeda8)
	
	Moeda1.position.x = 366
	Moeda1.position.y = 751
	
	Moeda2.position.x = 18
	Moeda2.position.y = 623
	
	Moeda3.position.x = 15
	Moeda3.position.y = 184
	
	Moeda4.position.x = 287
	Moeda4.position.y = -80
	
	Moeda5.position.x = 844
	Moeda5.position.y = 354
	
	Moeda6.position.x = 917
	Moeda6.position.y = 750
	
	Moeda7.position.x = 1167
	Moeda7.position.y = 748
	
	Moeda8.position.x = 1519
	Moeda8.position.y = 327
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
