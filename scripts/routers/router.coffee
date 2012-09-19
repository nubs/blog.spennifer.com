define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView) ->
    Router = Backbone.Router.extend
      initialize: (options) ->
        @appEl = options.appEl
      routes:
        '': 'index'
        'posts/:id': 'post'
      index: ->
        @posts = new Posts
        @postsView = new PostsView collection: @posts
        @appEl.html @postsView.el
        @posts.fetch()
      post: (id) ->
        @post = new Post _id: id
        @postView = new PostView model: @post
        @appEl.html @postView.el
        @post.fetch()
