# Template imports

module.exports = requireTemplates = ->

  require 'templates/application'
  require 'templates/index'
  require 'templates/about'
  require 'templates/_well'
  require 'templates/contact'
  require 'templates/landing'
  require 'templates/loading'

  require 'templates/cats/new'
  require 'templates/cats/show'
  require 'templates/cats/all'
  require 'templates/cats'

requireTemplates()
