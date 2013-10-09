module.exports = App.MarkerCollectionLayer =
  EmberLeaflet.MarkerCollectionLayer.extend
    contentBinding: 'controller'
    itemLayerClass: App.RadMarkerLayer
