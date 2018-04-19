extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	
	var scene = preload("actionButton.tscn")
	var actionRecruit = scene.instance()
	add_child(actionRecruit)
	var actionUpgrade = scene.instance()
	add_child(actionUpgrade)
	var actionWash = scene.instance()
	add_child(actionWash)
	var actionBribe = scene.instance()
	add_child(actionBribe)
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
