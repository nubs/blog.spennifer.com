define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView) ->
    Router = Backbone.Router.extend
      routes:
        '': 'index'
        'posts/:title': 'post'
      index: ->
        @posts = new Posts
        @postsView = new PostsView collection: @posts
        @posts.fetch()
      post: (title) ->
        @post = new Post title: title
        @postView = new PostView model: @post
        @post.fetch()
