@app =

  initialize: ->
    @bindEvents()

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false

  onDeviceReady: ->
    #canvas = $("#canvas")[0]
    #ctx = canvas.getContext("2d")
#
#
    #ctx.width  = canvas.width;
    #ctx.height = canvas.height;
#
    #alert [ctx.width, ctx.height]
#
    #ctx.fillStyle = "#00A308";
    #ctx.beginPath()
    #ctx.arc 75, 75, 10, 0, Math.PI * 2, true
    #ctx.closePath()
    #ctx.fill()

    preload = ->
      game.load.image "logo", "resources/img/phaser.png"

    create = ->
      logo = game.add.sprite(game.world.centerX, game.world.centerY, "logo")
      logo.anchor.setTo 0.5, 0.5

    game = new Phaser.Game(800, 600, Phaser.AUTO, "",
      preload: preload
      create: create
    )