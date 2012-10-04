define ['jquery', 'routers/router'], ($, RouterLoader) ->
  describe 'Routes', ->
    beforeEach ->
      @collection = new Backbone.Collection
      collectionFetchStub = sinon.stub(@collection, 'fetch').returns null
      @postsStub = sinon.stub().returns @collection
      @postsViewStub = sinon.stub()

      @post = new Backbone.Model
      postFetchStub = sinon.stub(@post, 'fetch').returns null
      @postStub = sinon.stub().returns @post
      @postViewStub = sinon.stub()

      @headerViewStub = sinon.stub()

      Router = new RouterLoader @postsStub, @postsViewStub, @postStub, @postViewStub, @headerViewStub
      @appEl = $ '<div>'
      @headerEl = $ '<header>'
      @router = new Router appEl: @appEl, headerEl: @headerEl
      @routeSpy = sinon.spy()
      try Backbone.history.start silent: true

      @router.navigate 'elsewhere'

    it 'defaults to the index route', ->
      @router.bind 'route:index', @routeSpy
      @router.navigate '', true
      expect(@routeSpy).toHaveBeenCalledOnce()
      expect(@routeSpy).toHaveBeenCalledWith()

    it 'routes to the posts detail page', ->
      @router.bind 'route:post', @routeSpy
      @router.navigate 'posts/1', true
      expect(@routeSpy).toHaveBeenCalledOnce()
      expect(@routeSpy).toHaveBeenCalledWith '1'
