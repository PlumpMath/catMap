window.App = require 'app'

#//////////////////////////////////
#// Templates
#//////////////////////////////////

require 'templates/application'
require 'templates/index'
require 'templates/about'
require 'templates/_well'
require 'templates/contact'
require 'templates/landing'

require 'templates/sessions/new'
require 'templates/sessions/destroy'

require 'templates/users/new'


#//////////////////////////////////
#// Models
#//////////////////////////////////

require 'models/user'
require 'models/session'

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

