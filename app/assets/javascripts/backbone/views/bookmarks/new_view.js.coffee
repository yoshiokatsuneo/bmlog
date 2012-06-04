Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.NewView extends Backbone.View
  template: JST["backbone/templates/bookmarks/new"]

  events:
    "submit #new-bookmark": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @model.bind("error", (model, error) ->
      alert(error)
    )
    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if ! @model._validate({},{silent:true})
      return
    @model.unset("errors")
    @model.set_tags_str(@model.get("tags_str"))
    
    @$("input").attr("disabled", "disabled")
    # @$("input").activity()
    # @collection.create(@model.toJSON(),
    @collection.create(@model,
      success: (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"

      error: (bookmark, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
        @$("input").removeAttr("disabled")
    )

  render: ->
    $(@el).html(@template(@model.toJSON_for_html() ))

    this.$("form").backboneLink(@model)

    return this
