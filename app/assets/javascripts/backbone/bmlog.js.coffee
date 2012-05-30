#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.Bmlog =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    new Bmlog.Routers.BookmarksRouter()
    Backbone.history.start()

$(document).ready ->
	Bmlog.init()
