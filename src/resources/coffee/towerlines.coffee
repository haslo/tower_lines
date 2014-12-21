class @TowerLines

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->

    preload = ->
      AndroidFullScreen.immersiveMode($.noop, $.noop)

    create = ->
      new DefaultMap().draw(game)
      new TowerSprite().draw(game, game.width / 2, game.height / 2, 2)

    width = document.body.offsetWidth;
    # TODO add AndroidFullScreen.immersiveHeight, somehow
    height = Math.max($(document).height(), $(window).height())
    console.log [width, height]
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )