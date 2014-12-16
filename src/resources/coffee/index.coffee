@app =

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->

    preload = ->
      game.load.image "logo", "resources/img/phaser.png"

    create = ->
      logo = game.add.sprite(game.world.centerX, game.world.centerY, "logo")
      logo.anchor.setTo 0.5, 0.5

    width = document.body.offsetWidth;
    height = document.body.offsetHeight;
    game = new Phaser.Game(width, height, Phaser.AUTO, "",
      preload: preload
      create: create
    )