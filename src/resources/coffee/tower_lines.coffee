class @TowerLines

  initialize: ->
    @bindEvents(this)

  bindEvents: ->
    document.addEventListener 'deviceready', @onDeviceReady, false

  onDeviceReady: =>
    width = document.body.offsetWidth
    height = Math.max($(document).height(), $(window).height())
    dips = window.devicePixelRatio
    @game = new Phaser.Game(width * dips, height * dips, Phaser.AUTO, '', {
      create: @create
    })
    $(window).resize =>
      @resizeGame(this)
  resizeGame: =>
    height = $(window).height()
    width = $(window).width()
    dips = window.devicePixelRatio
    @game.width = width * dips
    @game.height = height * dips
    if @game.renderType is Phaser.WEBGL
      @game.renderer.resize(width * dips, height * dips)
    @world.invalidateCaches()
    @world.draw()

  create: =>
    @initGame()
    @initWorld()
  initGame: =>
    @game.scale.scaleMode = Phaser.ScaleManager.SHOW_ALL
    @game.scale.setShowAll()
    @game.physics.startSystem(Phaser.Physics.ARCADE)
    callback = (scale, prevOrientation) ->
      alert prevOrientation
    @game.scale.onOrientationChange.add(callback)
  initWorld: =>
    @world = new World(@game, new DefaultMap(@game), window.devicePixelRatio)
    @world.add(new DefaultTower(0))
    @world.add(new DefaultTower(1))
    @world.draw()
