define ['backbone', 'handlebars', 'text!templates/post.hbs'], (Backbone, Handlebars, postTemplate) ->
  PostView = Backbone.View.extend
    tagName: 'li'
    template: Handlebars.compile postTemplate
    render: ->
      @$el.html @template @model.toJSON()
      this
