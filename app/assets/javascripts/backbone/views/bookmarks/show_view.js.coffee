Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.ShowView extends Backbone.View
  template: JST["backbone/templates/bookmarks/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
