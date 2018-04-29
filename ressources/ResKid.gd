extends "res://Ressource.gd"

func _ready():
    var imgFile = "res://sprites/GUI/kid.png"
    var img = Image.new()
    var itex = ImageTexture.new()
    img.load(imgFile)
    itex.create_from_image(img)
    image.texture = itex

    label.text = "None"

