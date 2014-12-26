class World
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
    @map.update()
    $.each @towers, (_, tower) ->
      tower.update()
    $.each @mobs, (_, mob) ->
      mob.update()

  draw: ->
    @map.draw()
