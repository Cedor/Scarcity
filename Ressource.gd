extends VBoxContainer

var type = ""
var imgFile="res://sprites/GUI/empty.png"
var image
var label
var quantity = 0

func _ready():
    initPic()
    updatePic()
    initLabel()
    updateLabel() 
    pass

func initPic():    
    self.image = TextureRect.new()
    add_child(image)

func initLabel():
    label = Label.new()
    add_child(label)
    
func updatePic():
    if !image :
        return
    var img = Image.new()
    var itex = ImageTexture.new()
    img.load(self.imgFile)
    itex.create_from_image(img)
    image.texture = itex
        
func updateLabel():
    if label :
        label.text = str(quantity)

func setType(type):
    if self.type != type :
        match type :
            "dollars" :
                self.imgFile = "res://sprites/GUI/dollars.png"
            "satisfaction":
                self.imgFile = "res://sprites/GUI/butler.png"
            "kid":
                self.imgFile = "res://sprites/GUI/kid.png"
            "guy":
                self.imgFile = "res://sprites/GUI/guy.png"
            "suspicion" :
                self.imgFile = "res://sprites/GUI/policeman.png"
            _:
                self.imgFile="res://sprites/GUI/empty.png"
        updatePic()

func increase(value = 1):
    self.quantity += value
    updateLabel()
    
func decrease(value = 1):
    self.increase(-value)
    
    