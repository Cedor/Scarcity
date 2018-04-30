extends TextureButton

var delay = 0
var rewards = {}
var label
var gainKid = 0
var gainGuy = 0
var gainDollars = 0
var gainCleanars = 0
var gainSatisfaction = 0

func _ready():
    labelInit()
    slotInit()
    updateDataText()

func updateDataText():
    if !label :
        return
    if delay > 0:
        #il faut afficher le delay, pas le gain du report
        pass
    else :
        var textLabel = ""
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
                "suspiscion" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["suspiscion"]) + " Suspiscion"
                    if rewards["suspiscion"] > 1 :
                        textLabel += "s"
                "satisfaction" :
                    if !textLabel.empty():
                        textLabel += ", "
                    textLabel += str(rewards["satisfaction"]) + " Satisfaction"
                    if rewards["suspiscion"] > 1 :
                        textLabel += "s"
                _ :
                    pass
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

func labelInit():
    self.label = Label.new()
    add_child(self.label)
    self.label.add_color_override("font_color", Color(0,0,0))
    #Ajuster la position.

func slotInit():
    connect("pressed", self, "_on_reportFile_pressed")
    pass

func _on_reportFile_pressed():
    if delay < 1:
        queue_free()
        #envoyer la mise à jour des ressources
    
