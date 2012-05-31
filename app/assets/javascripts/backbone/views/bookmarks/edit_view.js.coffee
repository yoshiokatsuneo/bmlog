Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.EditView extends Backbone.View
  template : JST["backbone/templates/bookmarks/edit"]

  events :
    "submit #edit-bookmark" : "update"

  initialize: () ->
    @model.bind("error", (model, error) ->
      alert(error)
    )

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

#    if ! @model._validate({},{silent:false})
#      return

    @model.set_tags_str(@model.get("tags_str"))
          
    @model.save(null,
      success : (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    # $(@el).html(@template(@model.toJSON() ))
    $(@el).html(@template(@model.toJSON_for_html()))

    this.$("form").backboneLink(@model)

    return this
