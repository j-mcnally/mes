App.Router.map ->
  this.route('index', { path: '/'})
      
class App.IndexRoute extends Ember.Route
  setupController: (controller, model) ->
    #object =
    #  param: value
    #if your controller takes parameters to bootstrap itself you can set it up here
    #controller.prepareData(object)
  model: (params) ->
    #return a model here
