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

  getGraphics: ->
    @graphics

  drawBorder: ->
    @graphics ||= @game.add.graphics(0, 0)
    @graphics.lineStyle 4, @borderColor, 1
    @graphics.beginFill @borderColor, 0.1
    @graphics.moveTo @translateXCoord(@offset),
                     @translateYCoord(@offset)
    @graphics.lineTo @translateXCoord(@width - @offset),
                     @translateYCoord(@offset)
    @graphics.lineTo @translateXCoord(@width - @offset),
                     @translateYCoord(@height - @offset)
    @graphics.lineTo @translateXCoord(@offset),
                     @translateYCoord(@height - @offset)
    @graphics.lineTo @translateXCoord(@offset),
                     @translateYCoord(@offset)
    @graphics.endFill()

  clear: ->
    @graphics.clear() unless @graphics is undefined

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

  draw: ->
    @clear()
    @drawBorder()
