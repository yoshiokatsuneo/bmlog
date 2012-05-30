Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.IndexView extends Backbone.View
  template: JST["backbone/templates/bookmarks/index"]

  initialize: () ->
    @options.bookmarks.bind('reset', @addAll)

  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Bmlog.Views.Bookmarks.BookmarkView({model : bookmark})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    @addAll()

    return this
