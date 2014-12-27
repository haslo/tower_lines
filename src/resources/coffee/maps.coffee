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
    @graphics.moveTo @translateXCoord(@width, @height, @offset),
                     @translateYCoord(@width, @height, @offset)
    @graphics.lineTo @translateXCoord(@width, @height, @width - @offset),
                     @translateYCoord(@width, @height, @offset)
    @graphics.lineTo @translateXCoord(@width, @height, @width - @offset),
                     @translateYCoord(@width, @height, @height - @offset)
    @graphics.lineTo @translateXCoord(@width, @height, @offset),
                     @translateYCoord(@width, @height, @height - @offset)
    @graphics.lineTo @translateXCoord(@width, @height, @offset),
                     @translateYCoord(@width, @height, @offset)
    @graphics.endFill()

  clear: ->
    @graphics.clear() unless @graphics is undefined

  fitSizeIntoCoords: (width, height) ->
    [
      @translateXCoord(width, height, 0),
      @translateYCoord(width, height, 0),
      @translateXCoord(width, height, width),
      @translateYCoord(width, height, height)
    ]

  translateXCoord: (width, height, coord) ->
    desiredWidth = height * @aspectRatio
    (coord - ((width - desiredWidth) / 2)) * @calculateScale()

  translateYCoord: (width, height, coord) ->
    desiredHeight = width / @aspectRatio
    console.log [coord, width, height, desiredHeight]
    (coord - ((height - desiredHeight) / 2)) * @calculateScale()

  calculateScale: ->
    width = @game.width / (if (@game.width > @game.height) then 2 else 1)
    height = @game.height
    actualAspectRatio = width / height
    if actualAspectRatio > @aspectRatio
      height / @height
    else
      width / @width

class @DefaultMap extends Map
  constructor: (game) ->
    super(game, 0xff0000, 200, 300)

  draw: ->
    @clear()
    @drawBorder()
