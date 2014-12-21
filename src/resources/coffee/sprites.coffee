class Sprite
  relativeCoord: (coord, root, scale) ->
    root + (coord * scale)

class @TowerSprite extends Sprite
  draw: (game, x, y, scale) ->
    shape = game.add.graphics x, y
    shape.lineStyle 2, 0x0000ff, 1 # width, color, alpha
    shape.beginFill 0x000055, 1 # color, alpha
    shape.moveTo @relativeCoord(10, x, scale),  @relativeCoord(10, y, scale)
    shape.lineTo @relativeCoord(-10, x, scale), @relativeCoord(10, y, scale)
    shape.lineTo @relativeCoord(-8, x, scale),  @relativeCoord(-5, y, scale)
    shape.lineTo @relativeCoord(-8, x, scale),  @relativeCoord(-10, y, scale)
    shape.lineTo @relativeCoord(8, x, scale),   @relativeCoord(-10, y, scale)
    shape.lineTo @relativeCoord(8, x, scale),   @relativeCoord(-5, y, scale)
    shape.lineTo @relativeCoord(10, x, scale),  @relativeCoord(10, y, scale)
    shape.endFill
