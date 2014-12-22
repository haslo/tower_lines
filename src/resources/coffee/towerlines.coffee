class @TowerLines

  initialize: ->
    @bindEvents(this)

  bindEvents: ->
    document.addEventListener 'deviceready', @onDeviceReady, false

  onDeviceReady: =>
    width = document.body.offsetWidth;
    height = Math.max($(document).height(), $(window).height())
    listeners = {
      create: @createListener
    }
    @game = new Phaser.Game(width, height, Phaser.AUTO, '', listeners)
    $(window).resize =>
      @resizeGame(this)

  createListener: =>
    console.log 'listening'
    @map ||= new DefaultMap(@game)
    @map.draw()

  resizeGame: =>
    height = $(window).height()
    width = $(window).width()
    @game.width = width
    @game.height = height
    @game.stage.bounds.width = width
    @game.stage.bounds.height = height
    if @game.renderType is Phaser.WEBGL
      @game.renderer.resize width, height
    @map.resize()
    @map.draw()
