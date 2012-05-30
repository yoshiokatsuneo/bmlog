Bmlog.Views.Tags ||= {}

class Bmlog.Views.Tags.NewView extends Backbone.View
  template: JST["backbone/templates/tags/new"]

  events:
    "submit #new-tag": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (tag) =>
        @model = tag
        window.location.hash = "/#{@model.id}"

      error: (tag, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
