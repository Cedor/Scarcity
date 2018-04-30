extends TextureButton

signal askForReport
signal endTurn

var label 
var costs = {}
var rewards = {} #{"kid" : 0, "guy" : 0, "dollars" : 0, "cleanars" : 0, "suspiscion" : 0, "satisfation" : 0}
var delay = 0
var report = false
var reportWait = ""

func _ready():
    textureInit()    
    labelInit()
    connexions()
    costsInit()
    rewardsInit()
    updateData()
    pass

func updateData():
    hint_tooltip = ""
    for key in costs.keys():
        match key :
            "kid" :
                hint_tooltip += str(costs["kid"]) + " Kid"
                if costs["kid"] > 1 :
                    hint_tooltip += "s"
            "guy" :
                if !hint_tooltip.empty():
                    hint_tooltip += ", "
                hint_tooltip += str(costs["guy"]) + " Guy"
                if costs["guy"] > 1 :
                    hint_tooltip += "s"
            "dollars" :
                if !hint_tooltip.empty():
                    hint_tooltip += ", "
                hint_tooltip += str(costs["dollars"]) + " Dollar"
                if costs["dollars"] > 1 :
                    hint_tooltip += "s"
            "cleanars" :
                if !hint_tooltip.empty():
                    hint_tooltip += ", "
                hint_tooltip += str(costs["cleanars"]) + " Clean dollar"
                if costs["cleanars"] > 1 :
                    hint_tooltip += "s"
            "suspiscion" :
                if !hint_tooltip.empty():
                    hint_tooltip += ", "
                hint_tooltip += str(costs["suspiscion"]) + " Suspiscion"
                if costs["suspiscion"] > 1 :
                    hint_tooltip += "s"
            "satisfaction" :
                if !hint_tooltip.empty():
                    hint_tooltip += ", "
                hint_tooltip += str(costs["satisfaction"]) + " Satisfaction"
                if costs["suspiscion"] > 1 :
                    hint_tooltip += "s"
            _ :
                pass
    if hint_tooltip.empty():
        hint_tooltip = "Free"

func setLabel(text):
    self.label.text = text

func setCostGuy(value):
    self.costs["guy"] = value

func setCostKid(value):
    self.costs["kid"] = value

func setCostDollars(value):
    self.costs["dollars"] = value

func setDelay(value):
    self.delay = value

func costsInit():
    #function to overwrite to set initial values
    pass

func rewardsInit():
    #function to overwrite to set initial values
    pass

func labelInit():
    label = Label.new()
    add_child(label)
    label.text = "ACTION"
    label.add_color_override("font_color", Color(0,0,0))
    #Ajuster la position.

func _on_actionButton_pressed():
    if self.report:
        emit_signal("askForReport", self.delay, self.rewards, self.reportWait)

func textureInit():
    var imgFile = "res://sprites/GUI/action.png"
    var img = Image.new()
    var itex = ImageTexture.new()
    img.load(imgFile)
    itex.create_from_image(img)
    self.texture_normal = itex
    
func connexions():
    var reports = get_node("/root/Overall/GUILayer/reportContainer")
    connect("askForReport", reports, "_onReportCreationAsked")
    connect("pressed", self, "_on_actionButton_pressed")
    


