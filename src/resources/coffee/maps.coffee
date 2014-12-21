class Map
  drawBorder: (game) ->
    if game.width > game.height
      # draw left

  mapCoords: (x, y) ->
    [x, y]

class @DefaultMap extends Map
  draw: (game) ->
    @drawBorder(game)
