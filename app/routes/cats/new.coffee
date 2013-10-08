module.exports = App.CatsNewRoute = Em.Route.extend
  setupController: (controller, model) ->
    controller.set 'content', {
      name: ''
      description: ''
      picture: ''
      place: ''
      profileStyle: ''
      created: ''
    }
