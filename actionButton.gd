extends TextureButton

signal askForReport

var label 
var costKid = 0
var costGuy = 0
var costDollars = 0
var delay = 0


func _ready():
    textureInit()    
    labelInit()
    slotInit()
    costsInit()
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

func setLabel(text):
    self.label.text = text

func setCostGuy(value):
    self.costGuy = value

func setCostKid(value):
    self.costKid = value

func setCostDollars(value):
    self.costDollars = value

func setCosts(dollars = 0, kid = 0, guy = 0):
    self.costDollars = dollars
    self.costKid = kid
    self.costGuy = guy


func setDelay(value):
    self.delay = value

func costsInit():
    #function to overwrite to set initial values
    pass

func labelInit():
    label = Label.new()
    add_child(label)
    label.text = "ACTION"
    label.add_color_override("font_color", Color(0,0,0))
    #Ajuster la position.

func _on_actionButton_pressed():
    emit_signal("askForReport")

func textureInit():
    var imgFile = "res://sprites/GUI/action.png"
    var img = Image.new()
    var itex = ImageTexture.new()
    img.load(imgFile)
    itex.create_from_image(img)
    self.texture_normal = itex
    
func slotInit():
    connect("pressed", self, "_on_actionButton_pressed")
    


