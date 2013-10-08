module.exports = App.IndexView = EmberLeaflet.MapView.extend
  classNames: 'catmap'

  childLayers: [
    EmberLeaflet.DefaultTileLayer,
    EmberLeaflet.MarkerCollectionLayer.extend
      contentBinding: 'controller'
  ]

  center: L.latLng 36.1030, -115.0811
  zoom: 10

  L.Icon.Default.imagePath = "/images"
