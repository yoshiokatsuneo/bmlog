class Bmlog.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    url: null

class Bmlog.Collections.BookmarksCollection extends Backbone.Collection
  model: Bmlog.Models.Bookmark
  url: '/api/bookmarks'
