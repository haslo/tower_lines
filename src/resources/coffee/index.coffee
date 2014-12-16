@app =

  initialize: ->
    @bindEvents()
    return

  bindEvents: ->
    document.addEventListener "deviceready", @onDeviceReady, false
    return

  onDeviceReady: ->
    return