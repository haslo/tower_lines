class Map
  drawBorder: (game, color, aspectRatio) ->
    shape = game.add.graphics 0, 0
    shape.lineStyle 4, color, 1
    shape.beginFill color, 0.1
    size = @calculateSize(game, aspectRatio)
    shape.moveTo size[0], size[1]
    shape.lineTo size[2], size[1]
    shape.lineTo size[2], size[3]
    shape.lineTo size[0], size[3]
    shape.lineTo size[0], size[1]

  calculateSize: (game, aspectRatio) ->
    if game.width > game.height
      @fitSizeIntoCoords game.width / 2, game.height, aspectRatio
    else
      @fitSizeIntoCoords game.width, game.height, aspectRatio

  fitSizeIntoCoords: (width, height, aspectRatio) ->
    offset = 10
    actualAspectRatio = width / height
    console.log [actualAspectRatio, aspectRatio]
    if actualAspectRatio > aspectRatio
      console.log '>'
      desiredWidth = height * aspectRatio
      console.log [desiredWidth, height]
      [
        ((width - desiredWidth) / 2) + offset,
        offset,
        width - ((width - desiredWidth) / 2) - offset,
        height - offset
      ]
    else
      console.log '<'
      desiredHeight = width / aspectRatio
      [
        offset,
        ((height - desiredHeight) / 2) + offset,
        width - offset,
        height - ((height - desiredHeight) / 2) - offset
      ]

  mapCoords: (x, y) ->
    [x, y]

class @DefaultMap extends Map
  draw: (game) ->
    @drawBorder(game, 0xff0000, 0.6)
