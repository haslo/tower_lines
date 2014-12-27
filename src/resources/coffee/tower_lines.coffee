class @TowerLines

  initialize: ->
    @bindEvents(this)

  bindEvents: ->
    document.addEventListener 'deviceready', @onDeviceReady, false

  onDeviceReady: =>
    width = document.body.offsetWidth
    height = Math.max($(document).height(), $(window).height())
    listeners = {
      create: @createListener
    }
    @game = new Phaser.Game(width, height, Phaser.AUTO, '', listeners)
    $(window).resize =>
      @resizeGame(this)

  createListener: =>
    @world = new World(new DefaultMap(@game))
    @world.add(new DefaultTower(30, 30))
    @world.draw()

  resizeGame: =>
    height = $(window).height()
    width = $(window).width()
    @game.width = width
    @game.height = height
    @game.stage.bounds.width = width
    @game.stage.bounds.height = height
    if @game.renderType is Phaser.WEBGL
      @game.renderer.resize width, height
    @world.draw()
