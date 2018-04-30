extends "res://actionButton.gd"

func _ready():
    pass

func costsInit():
    setCostDollars(5000)

func rewardsInit():
    self.report = true
    self.reportWait = "Recruitment in progress."
    self.delay = 2
    self.rewards["kid"] = 1

func labelInit():
    .labelInit()
    setLabel("RECRUIT")

func connexions():
    .connexions()
    var gameController = get_node("/root/Overall")
    connect("endTurn", gameController, "onTurnEnd")

func _on_actionButton_pressed():
    ._on_actionButton_pressed()
    emit_signal("endTurn")