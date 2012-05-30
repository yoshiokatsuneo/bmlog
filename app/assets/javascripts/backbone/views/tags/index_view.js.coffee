Bmlog.Views.Tags ||= {}

class Bmlog.Views.Tags.IndexView extends Backbone.View
  template: JST["backbone/templates/tags/index"]

  initialize: () ->
    @options.tags.bind('reset', @addAll)

  addAll: () =>
    @options.tags.each(@addOne)

  addOne: (tag) =>
    view = new Bmlog.Views.Tags.TagView({model : tag})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(tags: @options.tags.toJSON() ))
    @addAll()

    return this
