module.exports = Session = DS.Model.extend
  user: DS.attr 'string'
  password: DS.attr 'string'
