define ['underscore', 'backbone'], (_, Backbone) ->
  (Posts, PostsView, PostView, HeaderView) ->
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
        @posts ?= new Posts
        @postsView = new PostsView
          collection: @posts
          app: this
        @appEl.html @postsView.el
        if @posts.isEmpty() then @posts.fetch() else @postsView.render()
      post: (id) ->
        if @posts?
          @loadPost id
        else
          @posts = new Posts
          @posts.fetch
            success: _.bind((-> @loadPost id), this)
      loadPost: (id) ->
        @post = @posts.get id
        @postView = new PostView
          model: @post
          app: this
        @appEl.html @postView.el
        @postView.render()
