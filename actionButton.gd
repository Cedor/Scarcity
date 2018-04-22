extends TextureButton

signal askForReport

var label = "Toto"
var costKid = 0
var costGuy = 0
var costDollars = 0
var delay = 0


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	updateData()
	pass

func updateData():
	hint_tooltip = ""
	if costKid > 0 :
		hint_tooltip += str(costKid) + " Kid"
		if costKid > 1 :
			hint_tooltip += "s"
	if costGuy > 0 :
		if !hint_tooltip.empty():
			hint_tooltip += ", "
		hint_tooltip += str(costGuy) + " Guy"
		if costGuy > 1 :
			hint_tooltip += "s"
	if costDollars > 0 :
		if !hint_tooltip.empty():
			hint_tooltip += ", "
		hint_tooltip += str(costDollars) + " Dollars"
	if hint_tooltip.empty():
		hint_tooltip = "Free"
	var oLabel = get_node("actionLabel")
	oLabel.text = label

func setLabel(text):
	self.label = text
	self.updateData()

func setCostGuy(value):
	self.costGuy = value
	self.updateData()

func setCostKid(value):
	self.costKid = value
	self.updateData()

func setCostDollars(value):
	self.costDollars = value
	self.updateData()

func setCosts(dollars = 0, kid = 0, guy = 0):
	self.costDollars = dollars
	self.costKid = kid
	self.costGuy = guy
	self.updateData()

func setDelay(value):
	self.delay = value

func _on_actionButton_pressed():
	emit_signal("askForReport")
	pass # replace with function body
