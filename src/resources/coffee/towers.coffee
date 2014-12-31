class @Tower
  constructor: (index) ->
    @index = index

  index: ->
    @index

  setCoords: (x, y) ->
    @x = x
    @y = y

class @DefaultTower extends Tower
  draw: (map, graphics) ->
    new DefaultTowerSprite(@x, @y).draw(map, graphics)
