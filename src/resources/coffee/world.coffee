class @World
  constructor: (map, dips) ->
    @map = map
    @dips = dips
    @towers = []
    @mobs = []

  add: (item) ->
    if item instanceof Map
      @map = item
    if item instanceof Tower
      @map.initTower(item, item.index)
      @towers.push item
    if item instanceof Mob
      @map.initMob(item, item.index)
      @mobs.push item

  update: ->
    map = @map
    map.update()
    $.each @towers, (_, tower) ->
      tower.update(map)
    $.each @mobs, (_, mob) ->
      mob.update(map)

  draw: ->
    map = @map
    dips = @dips
    graphics = map.getGraphics()
    map.draw(graphics, dips)
    $.each @towers, (_, tower) ->
      tower.draw(map, graphics, dips)
    $.each @mobs, (_, mob) ->
      mob.draw(map, graphics, dips)
