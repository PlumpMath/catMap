App.AuthenticatedRoute = Em.Route.extend
  getUser: ->
    $.get '/api/users/me', (result) ->
      if result.status is 200
        @get('controller').set 'user', result.user

  beforeModel: ->
    # $.when(@getUser())
    # .then ->
    #   if !@controller.get 'user'
    #     console.log 'no user'
    #   else
    #     console.log "user: #{@get('controller').get 'user'}"
