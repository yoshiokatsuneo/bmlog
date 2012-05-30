Bmlog.Views.Tags ||= {}

class Bmlog.Views.Tags.EditView extends Backbone.View
  template : JST["backbone/templates/tags/edit"]

  events :
    "submit #edit-tag" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (tag) =>
        @model = tag
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
