class @TowerLines

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->

    preload = ->
      AndroidFullScreen.immersiveMode($.noop, $.noop)

    create = ->
      new DefaultMap(game).draw()
      new TowerSprite().draw(game, game.width / 2, game.height / 2, 2)

    width = document.body.offsetWidth;
    # TODO add AndroidFullScreen, maybe
    height = Math.max($(document).height(), $(window).height())
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )
