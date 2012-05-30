class Bmlog.Models.Tag extends Backbone.Model
  paramRoot: 'tag'

  defaults:
    name: null
    bookmark: null

class Bmlog.Collections.TagsCollection extends Backbone.Collection
  model: Bmlog.Models.Tag
  url: '/tags'
