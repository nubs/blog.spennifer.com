define ['underscore', 'backbone'], (_, Backbone) ->
  (Posts, PostsView, PostView, HeaderView, PostTeaserView) ->
    Router = Backbone.Router.extend
      initialize: (options) ->
        @appEl = options.appEl
        @headerEl = options.headerEl
        @leftEl = options.leftEl
        @rightEl = options.rightEl
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

        @loadSidePost @leftEl
        @loadSidePost @rightEl

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

        postIndex = @posts.indexOf @post
        @loadSidePost @leftEl, postIndex - 1
        @loadSidePost @rightEl, postIndex + 1

      loadSidePost: (el, index) ->
        if @posts.at? index
          teaserView = new PostTeaserView
            tagName: 'div'
            model: @posts.at index
            app: this
          el.html teaserView.el
          teaserView.render()
        else
          el.empty()
