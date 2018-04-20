extends HBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	var scene = preload("Ressource.tscn")
	var dollarRessource = scene.instance()
	add_child(dollarRessource)
	var kidRessource = scene.instance()
	add_child(kidRessource)
	var guyRessource = scene.instance()
	add_child(guyRessource)
	var satisfactionRessource = scene.instance()
	add_child(satisfactionRessource)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
