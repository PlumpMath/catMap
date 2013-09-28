module.exports = App.UsersNewController = Em.ObjectController.extend
  actions:
    createUser: ->
      data = @getProperties 'name', 'username', 'email', 'password'
      router = @get 'target'

      console.log data

      $.post '/api/users', { user: data }, (results) =>
        console.log 'great job: ' + results
        router.transitionTo 'index'

