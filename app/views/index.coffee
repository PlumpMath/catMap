module.exports = App.IndexView = EmberLeaflet.MapView.extend
  classNames: 'catmap'

  childLayers: [
    EmberLeaflet.TileLayer.extend
      tileUrl:
        'http://{s}.tile.cloudmade.com' +
        '/{key}/{styleId}/256/' +
        '{z}/{x}/{y}.png'
      options:
        key: '610fe2be68d34ec5ba47d00849edf7c1'
        styleId: ->
          # change appearance of map based on time of day
          currentDate = new Date()
          if currentDate.getHours() < 18
            return '110389'
          else
            return '110400'
    App.MarkerCollectionLayer
  ]

  center: L.latLng 36.1030, -115.0811
  zoom: 10

  init: ->
    @_super()
    L.Icon.Default.imagePath = "/images"
