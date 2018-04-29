extends TextureButton

var delay = 0
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
    pass

func updateDataText():
    if delay > 0:
        #il faut afficher le delay, pas le gain du report
        pass
    else :
        label.text = "Des trucs en plus\nEt en plus des trucs"
        pass

    
func setDelay(value):
    self.delay = value

func labelInit():
    label = Label.new()
    add_child(label)
    label.add_color_override("font_color", Color(0,0,0))
    #Ajuster la position.

func slotInit():
    connect("pressed", self, "_on_reportFile_pressed")
    pass

func _on_reportFile_pressed():
    if delay < 1:
        queue_free()
        #envoyer la mise à jour des ressources
    
