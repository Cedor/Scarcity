extends TextureButton

signal sendReward

var delay = 0
var rewards = {}
var waitMessage = ""
var doneMessage = ""
var label

func _ready():
    labelInit()
    connexion()
    updateDataText()

func updateDataText():
    if !label :
        return
    var textLabel = ""
    if delay > 0 :
        if waitMessage.length() > 0:
            textLabel = waitMessage + "\n" 
        textLabel += str(delay) + " turn"
        if delay > 1 :
            textLabel += "s"
    else :
        for key in rewards.keys():
            match key :
                "kid" :
                    textLabel += str(rewards["kid"]) + " Kid"
                    if rewards["kid"] > 1 :
                        textLabel += "s"
                "guy" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["guy"]) + " Guy"
                    if rewards["guy"] > 1 :
                        textLabel += "s"
                "dollars" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["dollars"]) + " Dollar"
                    if rewards["dollars"] > 1 :
                        textLabel += "s"
                "cleanars" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["cleanars"]) + " Clean dollar"
                    if rewards["cleanars"] > 1 :
                        textLabel += "s"
                "suspicion" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["suspicion"]) + " Suspicion"
                    if rewards["suspicion"] > 1 :
                        textLabel += "s"
                "satisfaction" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["satisfaction"]) + " Satisfaction"
                    if rewards["satisfaction"] > 1 :
                        textLabel += "s"
                _ :
                    pass
    if doneMessage.length() > 0:
        textLabel = doneMessage + "\n" + textLabel
    if textLabel.empty():
        textLabel = "Empty report"
    self.label.text = textLabel

func setRewards(rewards):
    self.rewards = rewards            
    updateDataText()
    
func setDelay(value):
    if self.delay != value :
        self.delay = value
        updateDataText()

func setMessages(messages):
    for key in messages.keys():
        match key:
            "wait":
                self.waitMessage = messages["wait"]
            "done":
                self.doneMessage = messages["done"]
            _:
                pass
    updateDataText()

func labelInit():
    self.label = Label.new()
    add_child(self.label)
    self.label.add_color_override("font_color", Color(0,0,0))
    #Ajuster la position.

func connexion():
    var ressources = get_node("/root/Overall/GUILayer/ressourceContainer")
    connect("sendReward", ressources, "onRewardSend")
    connect("pressed", self, "_on_reportFile_pressed")
    pass

func _on_reportFile_pressed():
    if delay < 1:
        if !rewards.empty():
            emit_signal("sendReward",rewards)
        queue_free()

func turnDone():
    if delay > 0 :
        self.delay-=1
        updateDataText()
