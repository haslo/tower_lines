class Sprite
  initShape: (game, color) ->
    shape = game.add.graphics 0, 0
    shape.lineStyle 2, color, 1
    shape.beginFill color, 0.4
    shape

  relativeCoord: (coord, root, scale) ->
    root + (coord * scale)

class @TowerSprite extends Sprite
  draw: (game, x, y, scale) ->
    shape = @initShape game, 0x0000ff
    shape.moveTo @relativeCoord(10, x, scale),  @relativeCoord(10, y, scale)
    shape.lineTo @relativeCoord(-10, x, scale), @relativeCoord(10, y, scale)
    shape.lineTo @relativeCoord(-8, x, scale),  @relativeCoord(-5, y, scale)
    shape.lineTo @relativeCoord(-8, x, scale),  @relativeCoord(-10, y, scale)
    shape.lineTo @relativeCoord(8, x, scale),   @relativeCoord(-10, y, scale)
    shape.lineTo @relativeCoord(8, x, scale),   @relativeCoord(-5, y, scale)
    shape.lineTo @relativeCoord(10, x, scale),  @relativeCoord(10, y, scale)
    shape.endFill
