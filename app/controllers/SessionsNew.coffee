module.exports = App.SessionsNewController = Em.ObjectController.extend
  content: null
  username: null
  password: null

  reset: ->
    @setProperties {
      username: ''
      password: ''
    }

  actions:
    loginUser: ->
      data = @getProperties 'username', 'password'
      router = @get 'target'

      console.log data

      $.post '/api/sessions/new', { user: data }, (result) ->
        if result.status is 200
          console.log 'logged in'
          router.transitionTo 'index'
