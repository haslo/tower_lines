class @World
  constructor: (map) ->
    @map = map
    @towers = []
    @mobs = []

  add: (item) ->
    if item instanceof Map
      @map = item
    if item instanceof Tower
      @towers.push item
    if item instanceof Mob
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
    map.draw()
    $.each @towers, (_, tower) ->
      tower.draw(map)
    $.each @mobs, (_, mob) ->
      mob.draw(map)
