class @Tower
  constructor: (index) ->
    @index = index

  index: ->
    @index

  setCoords: (x, y) ->
    @x = x
    @y = y

class @DefaultTower extends Tower
  draw: (map) ->
    new TowerSprite(@x, @y).draw(map)
