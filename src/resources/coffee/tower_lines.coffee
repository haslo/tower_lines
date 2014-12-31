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

  create: =>
    @game.stage.scale.startFullScreen()
    @game.stage.scaleMode = Phaser.StageScaleMode.EXACT_FIT
    @game.stage.scale.setShowAll()
    @game.stage.scale.refresh()
    @world = new World(new DefaultMap(@game), window.devicePixelRatio)
    @world.add(new DefaultTower(0))
    @world.add(new DefaultTower(1))
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
