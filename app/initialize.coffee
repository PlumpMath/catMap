window.App = require 'app'

require 'requireTemplates'
require 'requireModels'

#/////////////////////////////////
#// Controllers
#/////////////////////////////////

require 'controllers/application'
require 'controllers/usersNew'

#/////////////////////////////////
#// Views
#/////////////////////////////////

require 'views/index'

#/////////////////////////////////
#// Routes
#/////////////////////////////////

require 'routes/application'
require 'routes/usersNew'

#/////////////////////////////////
#// Store
#/////////////////////////////////

App.Store = DS.Store.extend
  adapter: DS.RESTAdapter.create()

DS.RESTAdapter.reopen
  namespace: '/api'

#/////////////////////////////////
#// Router
#/////////////////////////////////

App.Router.reopen(
  location: 'history'
)

App.Router.map ->
  @route "about"
  @route 'contact'
  @route 'landing'

  @resource 'sessions', ->
    @route 'new'
    @route 'destroy'

  @resource 'users', ->
    @route 'new'

    # require 'sessionInit'

