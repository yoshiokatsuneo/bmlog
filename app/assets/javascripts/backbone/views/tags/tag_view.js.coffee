Bmlog.Views.Tags ||= {}

class Bmlog.Views.Tags.TagView extends Backbone.View
  template: JST["backbone/templates/tags/tag"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
