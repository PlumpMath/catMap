module.exports = User = DS.Model.extend
  username: DS.attr 'string'
  password: DS.attr 'string'
  name: DS.attr 'string'
  email: DS.attr 'string'

