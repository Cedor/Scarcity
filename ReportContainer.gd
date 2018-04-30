extends VBoxContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
    pass

func _onReportCreationAsked(delay, rewards, messages):
    var scene = preload("ReportFile.tscn")
    var report = scene.instance()
    report.setDelay(delay)
    report.setRewards(rewards)
    report.setMessages(messages)    
    add_child(report)
    
func turnDone():
    for N in self.get_children():
        N.turnDone()