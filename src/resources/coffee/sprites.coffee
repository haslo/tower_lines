class Sprite
  moveTo: (map, x, y) ->
    coords = map.mapCoords(x + @x, y + @y)
    map.getGraphics().moveTo(coords[0], coords[1])

  lineTo: (map, x, y) ->
    coords = map.mapCoords(x + @x, y + @y)
    map.getGraphics().lineTo(coords[0], coords[1])

class @TowerSprite extends Sprite
  constructor: (x, y) ->
    @x = x
    @y = y

  draw: (map) ->
    scale = map.calculateScale()
    color = 0x0000ff
    map.getGraphics().lineStyle(2, color, 1)
    map.getGraphics().beginFill(color, 0.4)
    @moveTo(map,  10,  10)
    @lineTo(map, -10,  10)
    @lineTo(map, - 8, - 5)
    @lineTo(map, - 8, -10)
    @lineTo(map,   8, -10)
    @lineTo(map,   8, - 5)
    @lineTo(map,  10,  10)
    map.getGraphics().endFill()
