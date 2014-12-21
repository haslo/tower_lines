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
      new TowerSprite().draw game, game.width / 4, game.height / 4, 2

    width = document.body.offsetWidth;
    height = document.body.offsetHeight;
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )