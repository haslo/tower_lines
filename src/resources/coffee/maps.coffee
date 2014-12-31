class @Map
  constructor: (game, borderColor, width, height) ->
    @game = game
    @borderColor = borderColor
    @width = width
    @height = height
    @aspectRatio = @width / @height
    @offset = 5

  update: ->
    $.noop

  towerPositions: ->
    []

  initTower: (tower, index) ->
    coords = @towerPositions()[index]
    tower.setCoords(coords[0], coords[1])

  getGraphics: ->
    @graphics ||= @game.add.graphics(0, 0)

  clear: (graphics) ->
    graphics.clear() unless @graphics is undefined

  draw: (graphics) ->
    @clear(graphics)
    @drawBorder(graphics)
    @drawTowerPlaceholders(graphics)

  drawBorder: (graphics) ->
    graphics.lineStyle 4, @borderColor, 1
    graphics.beginFill @borderColor, 0.1
    graphics.moveTo @translateXCoord(@offset),
                     @translateYCoord(@offset)
    graphics.lineTo @translateXCoord(@width - @offset),
                     @translateYCoord(@offset)
    graphics.lineTo @translateXCoord(@width - @offset),
                     @translateYCoord(@height - @offset)
    graphics.lineTo @translateXCoord(@offset),
                     @translateYCoord(@height - @offset)
    graphics.lineTo @translateXCoord(@offset),
                     @translateYCoord(@offset)
    graphics.endFill()

  drawTowerPlaceholders: (graphics) ->
    map = this
    $.each @towerPositions(), (index, position) ->
      new TowerPlaceholderSprite(position[0], position[1]).draw(map, graphics)

  translateCoords: (x, y) ->
    [
      @translateXCoord(x),
      @translateYCoord(y)
    ]

  translateXCoord: (coord) ->
    coord * @pixelScale() + (@pixelWidth() - @width * @pixelScale()) / 2

  translateYCoord: (coord) ->
    coord * @pixelScale() + (@pixelHeight() - @height * @pixelScale()) / 2

  pixelScale: ->
    actualAspectRatio = @pixelWidth() / @pixelHeight()
    if actualAspectRatio > @aspectRatio
      @pixelHeight() / @height
    else
      @pixelWidth() / @width

  pixelWidth: ->
    if @game.width > @game.height
      @game.width / 2
    else
      @game.width

  pixelHeight: ->
    @game.height

class @DefaultMap extends Map
  constructor: (game) ->
    super(game, 0xff0000, 200, 300)

  towerPositions: ->
    [
      [ 30,  30],
      [105,  50],
      [ 60, 100],
      [170, 140],
      [140, 180],
      [ 80, 200],
      [120, 250]
    ]