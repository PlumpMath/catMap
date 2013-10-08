module.exports = App.CatsNewView = Em.View.extend
  templateName: 'cats/new'

  didInsertElement: ->
    $('.chosen-input').chosen()
