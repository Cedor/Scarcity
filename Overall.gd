extends Node2D
#GAME CONTROLLER

func _ready():

    pass

func onTurnEnd():
    get_node("GUILayer/reportContainer").turnDone()
    pass

