class Map
  constructor: (game, color, width, height) ->
    @game = game
    @color = color
    @width = width
    @height = height
    @aspectRatio = @width / @height
    console.log @aspectRatio

  drawBorder: ->
    shape = @game.add.graphics 0, 0
    shape.lineStyle 4, @color, 1
    shape.beginFill @color, 0.1
    size = @calculateSize()
    shape.moveTo size[0], size[1]
    shape.lineTo size[2], size[1]
    shape.lineTo size[2], size[3]
    shape.lineTo size[0], size[3]
    shape.lineTo size[0], size[1]

  calculateSize: ->
    if @game.width > @game.height
      @fitSizeIntoCoords @game.width / 2, @game.height
    else
      @fitSizeIntoCoords @game.width, @game.height

  fitSizeIntoCoords: (width, height) ->
    console.log @aspectRatio
    offset = 5
    actualAspectRatio = width / height
    if actualAspectRatio > @aspectRatio
      desiredWidth = height * @aspectRatio
      [
        ((width - desiredWidth) / 2) + offset,
        offset,
        width - ((width - desiredWidth) / 2) - offset,
        height - offset
      ]
    else
      desiredHeight = width / @aspectRatio
      [
        offset,
        ((height - desiredHeight) / 2) + offset,
        width - offset,
        height - ((height - desiredHeight) / 2) - offset
      ]

  mapCoords: (x, y) ->
    [x, y]

class @DefaultMap extends Map
  constructor: (game) ->
    super(game, 0xff0000, 60, 100)

  draw: ->
    @drawBorder()
