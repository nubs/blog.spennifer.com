define ['underscore', 'backbone'], (_, Backbone) ->
  (PostView) ->
    PostsView = Backbone.View.extend
      tagName: 'ul'
      className: 'posts unstyled'
      initialize: ->
        _.bindAll this, 'addPost', 'render'
        @collection.on 'reset', @render
      render: ->
        @collection.each @addPost
      addPost: (post) ->
        view = new PostView
          model: post
          app: @options.app
        @$el.append view.render().el
