class @Tower
  constructor: (index) ->
    @index = index

  index: ->
    @index

  setCoords: (x, y) ->
    @x = x
    @y = y

class @DefaultTower extends Tower
  draw: (map, graphics, dips) ->
    new DefaultTowerSprite(@x, @y, dips).draw(map, graphics)
