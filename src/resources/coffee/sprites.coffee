class Sprite
  initShape: (game, color) ->
    shape = game.add.graphics 0, 0
    shape.lineStyle 2, color, 1
    shape.beginFill color, 0.4
    shape

  moveTo: (map, shape, x, y) ->
    coords = map.mapCoords(x + @x, y + @y)
    shape.moveTo(coords[0], coords[1])

  lineTo: (map, shape, x, y) ->
    coords = map.mapCoords(x + @x, y + @y)
    shape.lineTo(coords[0], coords[1])

class @TowerSprite extends Sprite
  constructor: (x, y) ->
    @x = x
    @y = y

  draw: (game, map) ->
    shape = @initShape(game, 0x0000ff)
    scale = map.calculateScale()
    @moveTo(map, shape,  10,  10)
    @lineTo(map, shape, -10,  10)
    @lineTo(map, shape, - 8, - 5)
    @lineTo(map, shape, - 8, -10)
    @lineTo(map, shape,   8, -10)
    @lineTo(map, shape,   8, - 5)
    @lineTo(map, shape,  10,  10)
    shape.endFill
