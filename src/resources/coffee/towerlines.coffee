class @TowerLines

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->

    preload = ->
      AndroidFullScreen.immersiveMode($.noop, $.noop)

    create = ->
      map = new DefaultMap(game)
      map.draw()
      new TowerSprite(30, 30).draw(game, map)

    width = document.body.offsetWidth;
    # TODO add AndroidFullScreen, maybe
    height = Math.max($(document).height(), $(window).height())
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )
