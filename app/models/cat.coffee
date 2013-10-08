module.exports = App.Cat = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  picture: DS.attr 'string'
  place: DS.attr 'string'
  profileStyle: DS.attr 'string'
  created: DS.attr 'date'

  location: ( ->
    locAry = @get('place').split(' ')
    L.latLng locAry[0], locAry[1]
  ).property 'place'
