define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView) ->
    Router = Backbone.Router.extend
      routes:
        '': 'index'
        'posts/:id': 'post'
      index: ->
        @posts = new Posts
        @postsView = new PostsView collection: @posts
        @posts.fetch()
      post: (id) ->
        @post = new Post id: id
        @postView = new PostView model: @post
