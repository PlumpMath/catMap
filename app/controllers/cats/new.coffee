module.exports = App.CatsNewController = Em.ObjectController.extend
  styles: [
    'black-bg'
    'img-circle'
  ]

  actions:
    addCat: ->
      router = @get 'target'
      console.log 'saving...'
      newCat = @store.createRecord 'cat', {
        name: @get 'name'
        description: @get 'description'
        place: @get 'place'
        picture: @get 'picture'
        profileStyle: @get 'profileStyle'
        created: new Date()
      }
      newCat.save().then (cat) ->
        router.transitionTo 'cats.show', cat

