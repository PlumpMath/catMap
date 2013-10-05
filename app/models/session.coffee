App.Session = Em.Object.extend
  user: null

  getUser: ->
    $.get '/api/users/me', (result) =>
      if result.status is 200
        @set 'user', result.user.email
