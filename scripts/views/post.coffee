define ['underscore', 'backbone', 'handlebars', 'text!templates/post.hbs'], (_, Backbone, Handlebars, postTemplate) ->
  () ->
    PostView = Backbone.View.extend
      tagName: 'li'
      template: Handlebars.compile postTemplate

      initialize: ->
        _.bindAll this, 'render'
        @model.on 'change', @render

      render: ->
        @$el.html @template @model.toJSON()
        this
