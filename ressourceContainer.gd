extends HBoxContainer

var dollars
var kids
var guys
var satisfaction
var suspicion
var cleanars


func _ready():
    var scene = preload("res://Ressource.tscn")

    self.dollars = scene.instance()
    self.dollars.setType("dollars")
    add_child(self.dollars)

    self.kids = scene.instance()
    self.kids.setType("kid")
    add_child(self.kids)

    self.guys = scene.instance()
    self.guys.setType("guy")
    add_child(self.guys)

    self.satisfaction = scene.instance()
    self.satisfaction.setType("satisfaction")
    add_child(self.satisfaction)

    self.suspicion = scene.instance()
    self.suspicion.setType("suspicion")
    add_child(self.suspicion)

    self.cleanars = scene.instance()
    self.cleanars.setType("cleanars")
    add_child(self.cleanars)
