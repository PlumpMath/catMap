module.exports = App.CatsNewController = Em.ObjectController.extend
  actions:
    addCat: ->
      router = @get 'target'
      console.log 'saving...'
      @get('model').save().then (cat) ->
        router.transitionTo 'cats.show', cat

