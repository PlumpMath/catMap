module.exports = App.RadMarkerLayer = EmberLeaflet.MarkerLayer.extend(
  EmberLeaflet.PopupMixin, {
    popupContent: ( ->
      view = @view = @_parentLayer.createChildView 'mapPopup'
      view.set 'context', @get('content')
      view.set 'model', @get('model')
      Ember.View.states.inDOM.enter view
      view.createElement()

      view.get 'element'
    ).property()
  }
)
