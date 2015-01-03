class Sprite
  constructor: (x, y, dips) ->
    @x = x
    @y = y
    @dips = dips

  moveTo: (map, graphics, x, y) ->
    coords = map.translateCoords(x + @x, y + @y)
    graphics.moveTo(coords[0], coords[1])

  lineTo: (map, graphics, x, y) ->
    coords = map.translateCoords(x + @x, y + @y)
    graphics.lineTo(coords[0], coords[1])

class @TowerPlaceholderSprite extends Sprite
  draw: (map, graphics) ->
    color = 0xaa0000
    graphics.lineStyle(2 * @dips, color, 1)
    @moveTo(map, graphics,  9,  9)
    @lineTo(map, graphics, -9,  9)
    @lineTo(map, graphics, -9, -9)
    @lineTo(map, graphics,  9, -9)
    @lineTo(map, graphics,  9,  9)

class @DefaultTowerSprite extends Sprite
  draw: (map, graphics) ->
    color = 0x0000ff
    graphics.lineStyle(2 * @dips, color, 1)
    graphics.beginFill(color, 0.4)
    @moveTo(map, graphics,  10,  10)
    @lineTo(map, graphics, -10,  10)
    @lineTo(map, graphics, - 8, - 5)
    @lineTo(map, graphics, - 8, -10)
    @lineTo(map, graphics, - 2, -10)
    @lineTo(map, graphics,   0, -13)
    @lineTo(map, graphics,   2, -10)
    @lineTo(map, graphics,   8, -10)
    @lineTo(map, graphics,   8, - 5)
    @lineTo(map, graphics,  10,  10)
    graphics.endFill()
