# todo glowy thingy
# todo off screen rendering
# maybe:
# http://gamedev.stackexchange.com/questions/71998/how-can-i-apply-a-glow-filter-in-phaser
# almost definitely:
# http://www.goodboydigital.com/pixi-js-brings-canvas-and-webgl-masking/

class @DrawEngine
  constructor: (game, map) ->
    @game = game
    @map = map

  # functionPointer needs to be curried to only take context as param
  getSprite: (key, width, height, functionPointer) ->
    if @game.cache.getBitmapData(key) is null
      bitmapData = @game.add.bitmapData(width, height)
      functionPointer(bitmapData.context)
      @game.cache.addBitmapData(key, bitmapData)
    @game.cache.getBitmapData(key)

  drawLines: (context, lineWidth, lineColor, linePoints) ->
    context.strokeStyle = lineColor
    context.lineWidth = lineWidth
    $.each linePoints, (pathIndex, path) ->
      context.beginPath()
      context.moveTo(@map.translateX(path[0][0]), @map.translateY(path[0][1]))
      $.each path, (coordIndex, coord) ->
        if coordIndex != 0
          context.lineTo(@map.translateX(coord[0]), @map.translateY(coord[1]))
      context.stroke()

  drawSolid: (context, lineWidth, lineColor, fillColor, linePoints) ->
    context.strokeStyle = lineColor
    context.lineWidth = lineWidth
    context.fillStyle = fillColor
    $.each linePoints, (pathIndex, path) ->
      context.beginPath()
      context.moveTo(@map.translateX(path[0][0]), @map.translateY(path[0][1]))
      $.each path, (coordIndex, coord) ->
        if coordIndex != 0
          context.lineTo(@map.translateX(coord[0]), @map.translateY(coord[1]))
      context.closePath()
      context.stroke()
      context.fill()
