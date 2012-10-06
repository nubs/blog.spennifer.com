define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView, HeaderView) ->
    Router = Backbone.Router.extend
      initialize: (options) ->
        @appEl = options.appEl
        @headerEl = options.headerEl
        @headerView = new HeaderView
          el: @headerEl
          app: this
      routes:
        '': 'index'
        'posts/:id': 'post'
      index: ->
        @posts = new Posts
        @postsView = new PostsView
          collection: @posts
          app: this
        @appEl.html @postsView.el
        @posts.fetch()
      post: (id) ->
        @post = new Post _id: id
        @postView = new PostView
          model: @post
          app: this
        @appEl.html @postView.el
        @post.fetch()
