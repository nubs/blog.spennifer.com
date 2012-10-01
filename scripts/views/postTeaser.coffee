define ['underscore', 'backbone', 'handlebars', 'text!templates/postTeaser.hbs'], (_, Backbone, Handlebars, postTeaserTemplate) ->
  () ->
    PostTeaserView = Backbone.View.extend
      tagName: 'li'
      template: Handlebars.compile postTeaserTemplate

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
