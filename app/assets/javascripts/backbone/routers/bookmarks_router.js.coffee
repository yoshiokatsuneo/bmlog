class Bmlog.Routers.BookmarksRouter extends Backbone.Router
  initialize: (options) ->
    @bookmarks = new Bmlog.Collections.BookmarksCollection()
    # @bookmarks.reset options.bookmarks
    @bookmarks.fetch()

  routes:
    "new"      : "newBookmark"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newBookmark: ->
    @view = new Bmlog.Views.Bookmarks.NewView(collection: @bookmarks)
    $("#bookmarks").html(@view.render().el)

  index: ->
    @view = new Bmlog.Views.Bookmarks.IndexView(bookmarks: @bookmarks)
    $("#bookmarks").html(@view.render().el)

  show: (id) ->
    bookmark = @bookmarks.get(id)

    @view = new Bmlog.Views.Bookmarks.ShowView(model: bookmark)
    $("#bookmarks").html(@view.render().el)

  edit: (id) ->
    bookmark = @bookmarks.get(id)

    @view = new Bmlog.Views.Bookmarks.EditView(model: bookmark)
    $("#bookmarks").html(@view.render().el)
