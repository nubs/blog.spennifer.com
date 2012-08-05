define ['backbone', 'views/post'], (Backbone, PostView) ->
  PostsView = Backbone.View.extend
    tagName: 'ul'
    className: 'posts'
    render: ->
      @collection.each @addPost
    addPost: (post) ->
      view = new PostView model: post
