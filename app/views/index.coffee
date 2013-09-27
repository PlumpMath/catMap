App = require 'app'

module.exports = App.IndexView = Em.View.extend
  templateName: 'index'

  didInsertElement: ->
    mapHeight = ->
      $('#map').height($(window).height() - 50)

    $(window).resize ->
      mapHeight()

    mapHeight()

    map = L.map('map').setView [36.08, -115.1522], 10

    console.log 'hi'

    L.tileLayer(
      'http://{s}.tile.cloudmade.com/' +
      '610fe2be68d34ec5ba47d00849edf7c1' +
      '/997/256/{z}/{x}/{y}.png',
      {
        attribution: 'Map data &copy; [..]'
      },
    ).addTo map
