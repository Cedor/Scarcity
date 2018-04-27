extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var mapHeight = 20
var mapWidth = 40 
var tileSize = 64
var ratio = 0.5


func _ready():
    var tileBar = preload("tiles/TileBar.tscn")
    var tileWarehouse = preload("tiles/TileWarehouse.tscn")
    var tilePolice = preload("tiles/TilePolice.tscn")
    var tileNeutral = preload("tiles/TileNeutral.tscn")
    var currentTile
    for i in range(mapHeight):
        for j in range(mapWidth):
            var n = randi(8)%8
            match n:
                1:
                    currentTile = tileBar.instance();
                2:
                    currentTile = tileWarehouse.instance();
                3:
                    currentTile = tilePolice.instance();
                _:
                    currentTile = tileNeutral.instance();
            add_child(currentTile)
            currentTile.scale = Vector2(ratio,ratio)
            currentTile.position =  Vector2(position.x+j*tileSize*ratio,position.y+i*tileSize*ratio)


