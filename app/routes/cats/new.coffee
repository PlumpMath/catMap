module.exports = App.CatsNewRoute = Em.Route.extend
  model: ->
    @store.createRecord 'cat', {
      created: new Date()
    }

