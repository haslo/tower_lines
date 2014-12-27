class @Tower
  update: ->
    $.noop

class @DefaultTower
  constructor: (x, y) ->
    @x = x
    @y = y

  draw: (map) ->
    new TowerSprite(x, y).draw(map)
