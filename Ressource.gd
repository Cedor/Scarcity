extends VBoxContainer

var image
var label
var quantity

func _ready():
    image = TextureRect.new()
    add_child(image)
    
    label = Label.new()
    add_child(label)
    
    var imgFile = "res://sprites/GUI/butler.png"
    var img = Image.new()
    var itex = ImageTexture.new()
    img.load(imgFile)
    itex.create_from_image(img)
    image.texture = itex

    label.text = "Some"
    
    quantity = 0
    pass

