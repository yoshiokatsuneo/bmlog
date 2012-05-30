Bmlog.Views.Bookmarks ||= {}

class Bmlog.Views.Bookmarks.IndexView extends Backbone.View
  template: JST["backbone/templates/bookmarks/index"]

  events:
    "submit #search_form": "doSearch"

  initialize: () ->
    @options.bookmarks.bind('reset', @addAll)

  addAll: () =>
    @options.bookmarks.each(@addOne)

  addOne: (bookmark) =>
    view = new Bmlog.Views.Bookmarks.BookmarkView({model : bookmark})
    @$("tbody").append(view.render().el)

  doSearch: (event) ->
    event.preventDefault()
    event.stopPropagation()

    search = @$("#search_text").val()
    $("tbody").html("")
    @options.bookmarks.fetch({data: {search: search}})

  render: =>
    # $(@el).html(@template(bookmarks: @options.bookmarks.toJSON() ))
    $(@el).html(@template(bookmarks: @options.bookmarks.attributes ))
    @addAll()

    return this
