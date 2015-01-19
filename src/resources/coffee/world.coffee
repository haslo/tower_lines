class @World
  constructor: (game, map, dips) ->
    @game = game
    @map = map
    @dips = dips
    @towers = []
    @mobs = []

  add: (item) ->
    if item instanceof Tower
      @map.initTower(item, item.index)
      @towers.push item
    if item instanceof Mob
      @map.initMob(item, item.index)
      @mobs.push item
    item.map = @map

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
    map.draw(dips)
    $.each @towers, (_, tower) ->
      tower.draw(dips)
    $.each @mobs, (_, mob) ->
      mob.draw(dips)
