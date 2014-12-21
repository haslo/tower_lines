class @TowerLines

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->

    preload = ->
      game.load.image "mob", "resources/img/mob.png"
      game.load.image "logo", "resources/img/phaser.png"

    create = ->
      new DefaultMap().draw(game)
      new TowerSprite().draw(game, game.width / 2, game.height / 2, 2)

    width = document.body.offsetWidth;
    height = Math.max($(document).height(), $(window).height());
    console.log [width, height]
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )