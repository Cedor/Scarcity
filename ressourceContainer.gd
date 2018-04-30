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
    self.dollars.increase(15000)
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

func onPaymentAsked(costs):
     for key in costs.keys():
        match key :
            "kid" :
                self.kids.decrease(costs[key])
            "guy" :
                self.guys.decrease(costs[key])
            "dollars" :
                self.dollars.decrease(costs[key])
            "cleanars" :
                self.cleanars.decrease(costs[key])
            "suspicion" :
                self.suspicion.decrease(costs[key])
            "satisfaction" :
                self.satisfaction.decrease(costs[key])
            _ :
                pass


func onRewardSend(rewards):
    for key in rewards.keys():
        match key :
            "kid" :
                self.kids.increase(rewards[key])
            "guy" :
                self.guys.increase(rewards[key])
            "dollars" :
                self.dollars.increase(rewards[key])
            "cleanars" :
                self.cleanars.increase(rewards[key])
            "suspicion" :
                self.suspicion.increase(rewards[key])
            "satisfaction" :
                self.satisfaction.increase(rewards[key])
            _ :
                pass
