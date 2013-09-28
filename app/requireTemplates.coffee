# Template imports

module.exports = requireTemplates = ->

  require 'templates/application'
  require 'templates/index'
  require 'templates/about'
  require 'templates/_well'
  require 'templates/contact'
  require 'templates/landing'

  require 'templates/sessions/new'
  require 'templates/sessions/destroy'

  require 'templates/users/new'

requireTemplates()
