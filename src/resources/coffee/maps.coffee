class Map
  constructor: (game, color, width, height) ->
    @game = game
    @color = color
    @width = width
    @height = height
    @aspectRatio = @width / @height
    @offset = 5

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
    actualAspectRatio = width / height
    if actualAspectRatio > @aspectRatio
      desiredWidth = height * @aspectRatio
      [
        ((width - desiredWidth) / 2) + @offset,
        @offset,
        width - ((width - desiredWidth) / 2) - @offset,
        height - @offset
      ]
    else
      desiredHeight = width / @aspectRatio
      [
        @offset,
        ((height - desiredHeight) / 2) + @offset,
        width - @offset,
        height - ((height - desiredHeight) / 2) - @offset
      ]

  mapCoords: (x, y) ->
    @mappers ||= {}
    if @mappers[['x', @width, @height]] is undefined
      width = if (@game.width > @game.height) then (@game.width / 2) else @game.width
      height = @game.height
      actualAspectRatio = width / height
      originX = if (actualAspectRatio > @aspectRatio) then ((width - (height * @aspectRatio)) / 2 + @offset) else @offset
      scaleX = @calculateScale()
      @mappers[['x', @width, @height]] = (x) ->
                console.log 'x: ' + originX
                originX + x * scaleX
    if @mappers[['y', @width, @height]] is undefined
      width = if (@game.width > @game.height) then (@game.width / 2) else @game.width
      height = @game.height
      actualAspectRatio = width / height
      originY = if (actualAspectRatio > @aspectRatio) then @offset else ((height - (width / @aspectRatio)) / 2 + @offset)
      scaleY = @calculateScale()
      @mappers[['y', @width, @height]] = (y) ->
                console.log 'y:' + originY
                originY + y * scaleY
    [@mappers[['x', @width, @height]](x), @mappers[['y', @width, @height]](y)]

  calculateScale: ->
    width = if (@game.width > @game.height) then (@game.width / 2) else @game.width
    height = @game.height
    actualAspectRatio = width / height
    if actualAspectRatio > @aspectRatio
      (height - 2 * @offset) / @height
    else
      (width - 2 * @offset) / @width

class @DefaultMap extends Map
  constructor: (game) ->
    super(game, 0xff0000, 200, 300)

  draw: ->
    @drawBorder()
