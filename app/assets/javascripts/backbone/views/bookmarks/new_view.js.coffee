Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.NewView extends Backbone.View
  template: JST["backbone/templates/bookmarks/new"]

  events:
    "submit #new-bookmark": "save"

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
    @model.set_tags_str(@model.get("tags_str"))
    
    # @collection.create(@model.toJSON(),
    @collection.create(@model,
      success: (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"

      error: (bookmark, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON_for_html() ))

    this.$("form").backboneLink(@model)

    return this
