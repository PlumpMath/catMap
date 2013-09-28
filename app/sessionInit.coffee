App = require 'app'

# Session Iniitializer
Ember.Application.initializer
  name: 'session'

  initialize: (container, application) ->
    App.Session = Ember.Object.extend(
      init: ->
        @_super()
        @set 'authToken', $.cookie('auth_token')
        @set 'authAccountId', $.cookie('auth_account')

      authTokenChanged: (->
        $.cookie 'auth_token', @get('authToken')
      ).observes 'authAccountId'
    ).create()

Ember.$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  if !jqXHR.crossDomain
    jqXHR.setRequestHeader(
      'X-AUTHENTICATION-TOKEN',
      App.Session.get 'authToken'
    )

