define ['backbone'], (Backbone) ->
  (Posts, PostsView, Post, PostView, HeaderView) ->
    Router = Backbone.Router.extend
      initialize: (options) ->
        @appEl = options.appEl
        @headerEl = options.headerEl
      routes:
        '': 'index'
        'posts/:id': 'post'
      index: ->
        @headerView = new HeaderView
          el: @headerEl
          app: this
        @posts = new Posts
        @postsView = new PostsView
          collection: @posts
          app: this
        @appEl.html @postsView.el
        @posts.fetch()
      post: (id) ->
        @headerView = new HeaderView
          el: @headerEl
          app: this
        @post = new Post _id: id
        @postView = new PostView
          model: @post
          app: this
        @appEl.html @postView.el
        @post.fetch()
