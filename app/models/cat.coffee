module.exports = App.Cat = DS.Model.extend
  name: DS.attr 'string'
  description: DS.attr 'string'
  picture: DS.attr 'string'
  location: DS.attr 'string'
  profileStyle: DS.attr 'string'
  created: DS.attr 'date'
