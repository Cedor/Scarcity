extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    var scene = preload("actionButton.tscn")
    var reports = get_node("/root/Overall/GUILayer/reportContainer")
    
    var actionRecruit = scene.instance()
    add_child(actionRecruit)
    actionRecruit.connect("askForReport", reports, "_onReportCreationAsked")
    
    var actionUpgrade = scene.instance()
    add_child(actionUpgrade)
    actionUpgrade.connect("askForReport", reports, "_onReportCreationAsked")
    
    var actionWash = scene.instance()
    add_child(actionWash)
    actionWash.connect("askForReport", reports, "_onReportCreationAsked")
    
    var actionBribe = scene.instance()
    add_child(actionBribe)
    actionBribe.connect("askForReport", reports, "_onReportCreationAsked")
    



#func _process(delta):
#    # Called every frame. Delta is time since last frame.
#    # Update game logic here.
#    pass
