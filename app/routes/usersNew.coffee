User = require '../models/user'

module.exports = App.UsersNewRoute = Em.Route.extend
  setupController: (controller, model) ->
    user = @store.createRecord User, {
      name: ''
      username: ''
      email: ''
      password: ''
    }

    @controller.set 'model', user
