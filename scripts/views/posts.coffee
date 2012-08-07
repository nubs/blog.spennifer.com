define ['backbone'], (Backbone) ->
  (PostView) ->
    PostsView = Backbone.View.extend
      tagName: 'ul'
      className: 'posts'
      initialize: ->
        _.bindAll this, 'addPost'
      render: ->
        @collection.each @addPost
      addPost: (post) ->
        view = new PostView model: post
        @$el.append view.render().el
