Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.BookmarkView extends Backbone.View
  template: JST["backbone/templates/bookmarks/bookmark"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    # $(@el).html(@template(@model.toJSON() ))
    $(@el).html(@template(@model.toJSON_for_html()))
    return this
