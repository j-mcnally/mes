App.Router.map ->
  this.route('index', { path: '/'})
      
App.IndexRoute = Ember.Route.extend
  setupController: (controller, model) ->
    #object =
    #  param: value
    #if your controller takes parameters to bootstrap itself you can set it up here
    #controller.prepareData(object)
  model: (params) ->
    #return a model here
