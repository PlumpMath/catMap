module.exports = App.ApplicationRoute = Em.Route.extend
  activate: ->
    $(document).attr 'title', 'CatMap'
  
