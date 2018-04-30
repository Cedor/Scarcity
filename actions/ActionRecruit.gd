extends "res://actionButton.gd"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    pass

func costsInit():
    setCostDollars(5000)

func rewardsInit():
    self.rewards["kid"] = 1

func labelInit():
    .labelInit()
    setLabel("RECRUIT")