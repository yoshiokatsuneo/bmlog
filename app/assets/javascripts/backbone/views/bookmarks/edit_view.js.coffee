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

    #if ! @model._validate({},{silent:false})
    #  return

    @model.set_tags_str(@model.get("tags_str"))
    
    @$("input").attr("disabled", "disabled")
    @$("#busy").activity({length:3, padding:0})
        
    @model.save(null,
      success : (bookmark) =>
        @model = bookmark
        window.location.hash = "/#{@model.id}"
        @$("input").removeAttr("disabled")
      
      error: (bookmark, jqXHR) =>
        @$("input").removeAttr("disabled")
        @$("#busy").activity(false)
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
        
    )

  render : ->
    # $(@el).html(@template(@model.toJSON() ))
    $(@el).html(@template(@model.toJSON_for_html()))

    this.$("form").backboneLink(@model)

    return this
