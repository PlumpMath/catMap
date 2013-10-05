module.exports = App.CatsShowController = Em.ObjectController.extend
  actions:
    goToCat: ->
      console.log 'you clicked a cat'
