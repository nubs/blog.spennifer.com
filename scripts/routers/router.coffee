define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView) ->
    Router = Backbone.Router.extend
      initialize: (options) ->
        @appEl = options.appEl
      routes:
        '': 'index'
        'posts/:title': 'post'
      index: ->
        @posts = new Posts
        @postsView = new PostsView collection: @posts
        @appEl.html @postsView.el
        @posts.fetch()
      post: (title) ->
        @post = new Post title: title
        @postView = new PostView model: @post
        @appEl.html @postView.el
        @post.fetch()
