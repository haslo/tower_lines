class @Map
  constructor: (game, borderColor, pathColor, width, height) ->
    @game = game
    @borderColor = borderColor
    @pathColor = pathColor
    @width = width
    @height = height
    @aspectRatio = @width / @height
    @offset = 5

  update: ->
    $.noop

  initTower: (tower, index) ->
    coords = @towerPositions()[index]
    tower.setCoords(coords[0], coords[1])

  draw: (graphics, dips) ->
    @drawBorder(graphics, dips)
    @drawPaths(graphics, dips)
    @drawTowerPlaceholders(graphics, dips)

  drawBorder: (graphics, dips) ->
    graphics.lineStyle 4 * dips, @borderColor, 1
    graphics.beginFill @borderColor, 0.1
    graphics.moveTo @translateX(@offset),
                    @translateY(@offset)
    graphics.lineTo @translateX(@width - @offset),
                    @translateY(@offset)
    graphics.lineTo @translateX(@width - @offset),
                    @translateY(@height - @offset)
    graphics.lineTo @translateX(@offset),
                    @translateY(@height - @offset)
    graphics.lineTo @translateX(@offset),
                    @translateY(@offset)
    graphics.endFill()

  drawPaths: (graphics, dips) ->
    map = this
    graphics.lineStyle 4 * dips, @pathColor, 0.5
    $.each @pathNodes(), (pathIndex, path) ->
      graphics.moveTo map.translateX(path[0][0]),
                      map.translateY(path[0][1])
      $.each path, (coordIndex, coord) ->
        if coordIndex != 0
          graphics.lineTo map.translateX(coord[0]),
                          map.translateY(coord[1])

  drawTowerPlaceholders: (graphics, dips) ->
    map = this
    $.each @towerPositions(), (index, position) ->
      sprite = new TowerPlaceholderSprite(position[0], position[1], dips)
      sprite.draw(map, graphics)

  translateCoords: (x, y) ->
    [
      @translateX(x),
      @translateY(y)
    ]

  translateX: (coord) ->
    coord * @pixelScale() + (@pixelWidth() - @width * @pixelScale()) / 2

  translateY: (coord) ->
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
    super(game, 0xff0000, 0x00ff00, 200, 300)

  towerPositions: ->
    [
      [ 35,  30],
      [ 90,  50],
      [ 50, 100],
      [170, 130],
      [ 50, 180],
      [100, 185],
      [120, 245]
    ]

  pathNodes: ->
    [
      [
        [ 50,   2],
        [ 70,  60],
        [ 25,  70],
        [ 30, 171],
        [ 40, 252],
        [145, 271],
        [165, 298],
      ],
      [
        [198,  50],
        [170, 100]
        [ 27, 170],
        [ 42, 250],
        [151, 270],
        [160, 298],
      ]
    ]