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
        @posts ?= new Posts
        @postsView = new PostsView
          collection: @posts
          app: this
        @appEl.html @postsView.el
        if @posts.isEmpty() then @posts.fetch() else @postsView.render()
      post: (id) ->
        @post = if @posts? then @posts.get id else new Post _id: id
        @postView = new PostView
          model: @post
          app: this
        @appEl.html @postView.el
        if @posts? then @postView.render() else @post.fetch()
