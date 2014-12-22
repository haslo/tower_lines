class Map
  constructor: (game, borderColor, width, height) ->
    @game = game
    @borderColor = borderColor
    @width = width
    @height = height
    @aspectRatio = @width / @height
    @offset = 5

  getGraphics: ->
    @graphics

  drawBorder: ->
    @graphics ||= @game.add.graphics(0, 0)
    @graphics.lineStyle 4, @borderColor, 1
    @graphics.beginFill @borderColor, 0.1
    size = @calculateSize()
    @graphics.moveTo size[0], size[1]
    @graphics.lineTo size[2], size[1]
    @graphics.lineTo size[2], size[3]
    @graphics.lineTo size[0], size[3]
    @graphics.lineTo size[0], size[1]
    @graphics.endFill()

  clear: ->
    @graphics.clear() unless @graphics is undefined

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

  resize: ->
    @mappers = {}

  mapCoords: (x, y) ->
    @mappers ||= {}
    width = if (@game.width > @game.height) then (@game.width / 2) else @game.width
    height = @game.height
    actualAspectRatio = width / height
    if @mappers['x'] is undefined
      originX = if (actualAspectRatio > @aspectRatio) then ((width - (height * @aspectRatio)) / 2 + @offset) else @offset
      scaleX = @calculateScale()
      @mappers['x'] = (x) -> originX + x * scaleX
    if @mappers['y'] is undefined
      originY = if (actualAspectRatio > @aspectRatio) then @offset else ((height - (width / @aspectRatio)) / 2 + @offset)
      scaleY = @calculateScale()
      @mappers['y'] = (y) -> originY + y * scaleY
    [@mappers['x'](x), @mappers['y'](y)]

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
    @clear()
    @drawBorder()
    new TowerSprite( 30,  30).draw(this)
    new TowerSprite( 50, 100).draw(this)
    new TowerSprite(180, 200).draw(this)
    new TowerSprite( 30, 250).draw(this)
