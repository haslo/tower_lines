class Sprite
  initShape: (game, color) ->
    shape = game.add.graphics 0, 0
    shape.lineStyle 2, color, 1
    shape.beginFill color, 0.4
    shape

  relativeCoord: (coord, root, scale) ->
    root + (coord * scale)

class @TowerSprite extends Sprite
  constructor: (x, y) ->
    @x = x
    @y = y

  draw: (game, map) ->
    shape = @initShape(game, 0x0000ff)
    scale = map.calculateScale()
    c = map.mapCoords( 10 + @x,  10 + @y); shape.moveTo(c[0], c[1])
    c = map.mapCoords(-10 + @x,  10 + @y); shape.lineTo(c[0], c[1])
    c = map.mapCoords(- 8 + @x, - 5 + @y); shape.lineTo(c[0], c[1])
    c = map.mapCoords(- 8 + @x, -10 + @y); shape.lineTo(c[0], c[1])
    c = map.mapCoords(  8 + @x, -10 + @y); shape.lineTo(c[0], c[1])
    c = map.mapCoords(  8 + @x, - 5 + @y); shape.lineTo(c[0], c[1])
    c = map.mapCoords( 10 + @x,  10 + @y); shape.lineTo(c[0], c[1])
    shape.endFill
