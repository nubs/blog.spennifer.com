define ['backbone', 'collections/posts', 'views/posts'], (Backbone, Posts, PostsView) ->
  Router = Backbone.Router.extend
    routes:
      '': 'index'
      'posts/:id': 'post'
    index: ->
      @posts = new Posts
      @postsView = new PostsView collection: @posts
      @posts.fetch()
    post: (id) ->
