#= require_self
#=require_tree ./models 
#= require_tree ./controllers
#= require_tree ./views
#= require      ./routes
#= require ./templates



window.A = window.App = Ember.Application.create
  rootElement : "#ember-application-root"
  LOG_TRANSITIONS: true





