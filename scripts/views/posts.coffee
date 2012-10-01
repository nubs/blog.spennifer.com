define ['underscore', 'backbone'], (_, Backbone) ->
  (PostTeaserView) ->
    PostsView = Backbone.View.extend
      tagName: 'ul'
      className: 'posts unstyled'
      initialize: ->
        _.bindAll this, 'addPost', 'render'
        @collection.on 'reset', @render
      render: ->
        @collection.each @addPost
      addPost: (post) ->
        view = new PostTeaserView
          model: post
          app: @options.app
        @$el.append view.render().el
