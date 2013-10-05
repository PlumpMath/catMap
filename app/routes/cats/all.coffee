module.exports = App.CatsAllRoute = Em.Route.extend
  model: ->
    @store.findAll 'cat'

