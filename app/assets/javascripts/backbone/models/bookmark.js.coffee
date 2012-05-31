class Bmlog.Models.Bookmark extends Backbone.Model
  paramRoot: 'bookmark'

  defaults:
    url: null

  validate: (attrs) ->
    errors=[]
    if(_.isEmpty(attrs.url))
      errors.push("URL is empty")
    if errors.length == 0
      null
    else
      errors
    # _.any(errors) ? errors : null;
    
  initialize: ->
    if typeof @attributes.tags == 'undefined'
      @attributes.tags = []
    
  set_tags_str: (tags_str) ->
    for tag in @attributes.tags
      tagmodel = new Bmlog.Models.Tag(tag);
      tagmodel.destroy()
    @attributes.tags = [];
    if typeof tags_str != "undefined"
      tags_array = tags_str.split(/[, ]+/)
      for tag in tags_array
        @attributes.tags.push({name:tag})

  get_tags_str: ->
    @attributes.tags.map((tag)-> tag.name ).join(', ')

  toJSON_for_html: ->
    attr = this.attributes
    attr.tags_str = @get_tags_str()
    attr

  toJSON: ->
    json = _.clone(this.attributes)
    json.tags_attributes = json.tags
    # json.tags_attributes = this.tags.map((tag)->{name: tag.get("name")})
    delete json.created_at
    delete json.updated_at
    delete json.tags_str
    delete json.tags
    # alert("json =" + JSON.stringfy(json))
    json



class Bmlog.Collections.BookmarksCollection extends Backbone.Collection
  model: Bmlog.Models.Bookmark
  url: '/api/bookmarks'
