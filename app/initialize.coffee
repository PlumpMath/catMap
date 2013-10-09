window.App = require 'app'

# socket = io.connect 'http://localhost'

require 'requireTemplates'
require 'requireModels'

#/////////////////////////////////
#// Controllers
#/////////////////////////////////

require 'controllers/application'
require 'controllers/cats/new'
require 'controllers/cats/show'
require 'controllers/cats/all'
require 'controllers/index'

#/////////////////////////////////
#// Views
#/////////////////////////////////

require 'views/markerLayer'
require 'views/markerCollectionLayer'
require 'views/map-popup'
require 'views/index'

require 'views/cats/new'

#/////////////////////////////////
#// Routes
#/////////////////////////////////

require 'routes/application'
require 'routes/loading'
require 'routes/cats/new'
require 'routes/cats/show'
require 'routes/cats/all'
require 'routes/index'

#/////////////////////////////////
#// Store
#/////////////////////////////////

App.ApplicationAdapter = DS.RESTAdapter.extend
  namespace: 'api'

App.CatSerializer = DS.RESTSerializer.extend
  normalize: (type, hash, property) ->
    json =
      id: hash._id
      name: hash.name
      description: hash.description
      picture: hash.picture
      place: hash.place.join ' '
      profileStyle: hash.profileStyle
      created: hash.created

    delete hash._id

    @_super type, json, property

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

  @resource 'cats', ->
    @route 'new'
    @route 'show', { path: '/show/:cat_id' }
    @route 'all', { path: '/show/all' }
    @route 'edit', { path: '/edit/:cat_id' }
    @route 'delete', { path: '/delete/:cat_id' }
