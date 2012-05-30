Bmlog.Views.Tags ||= {}

class Bmlog.Views.Tags.ShowView extends Backbone.View
  template: JST["backbone/templates/tags/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
