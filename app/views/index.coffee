App = require 'app'

module.exports = App.IndexView = Em.View.extend
  templateName: 'index'

  didInsertElement: ->
    map = L.map('map').setView [51.505, -0.09], 13

    console.log 'hi'

    L.tileLayer(
      'http://{s}.tile.cloudmade.com/' +
      '610fe2be68d34ec5ba47d00849edf7c1' +
      '/997/256/{z}/{x}/{y}.png',
      {
        attribution: 'Map data &copy; [..]'
        maxZoom: 18
      },
    ).addTo map
