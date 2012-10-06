define ['underscore', 'backbone', 'handlebars', 'text!templates/post.hbs'], (_, Backbone, Handlebars, postTemplate) ->
  () ->
    PostView = Backbone.View.extend
      tagName: 'article'
      template: Handlebars.compile postTemplate

      events:
        'click .postTitle': 'navigateTo'

      initialize: ->
        _.bindAll this, 'render', 'navigateTo'
        @model.on 'change', @render

      navigateTo: (e) ->
        e.preventDefault()
        @options.app.navigate 'posts/' + @model.id, trigger: true

      render: ->
        @$el.html @template @model.toJSON()
        this
