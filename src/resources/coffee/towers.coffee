class @Tower
  constructor: (x, y, map) ->
    @x = x
    @y = y
    @map = map

class @DefaultTower extends Tower
  draw: (map) ->
    new TowerSprite(@x, @y).draw(map)
