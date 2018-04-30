extends "res://actionButton.gd"


func _ready():
    pass

func costsInit():
    setCostDollars(3000)
    setCostKid(1)

func rewardsInit():
    self.report = true
    self.reportMessages["done"] = "Recruited:"
    self.rewards["guy"] = 1

func labelInit():
    .labelInit()
    setLabel("Upgrade")

func connexions():
    .connexions()
    var gameController = get_node("/root/Overall")
    connect("endTurn", gameController, "onTurnEnd")

func _on_actionButton_pressed():
    ._on_actionButton_pressed()
    emit_signal("endTurn")