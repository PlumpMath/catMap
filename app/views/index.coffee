module.exports = App.IndexView = EmberLeaflet.MapView.extend
  classNames: 'catmap'

  childLayers: [
    EmberLeaflet.DefaultTileLayer,
    App.MarkerCollectionLayer
  ]

  center: L.latLng 36.1030, -115.0811
  zoom: 10

  init: ->
    @_super()
    L.Icon.Default.imagePath = "/images"
