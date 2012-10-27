define ['jquery', 'routers/router'], ($, RouterLoader) ->
  describe 'Routes', ->
    beforeEach ->
      @collection = new Backbone.Collection
      @post = new Backbone.Model

      @collectionFetchStub = sinon.stub(@collection, 'fetch').returns null
      @postsStub = sinon.stub().returns @collection

      @postsViewStub = sinon.stub()
      @postViewStub = sinon.stub()
      @headerViewStub = sinon.stub()
      @postTeaserViewStub = sinon.stub().returns new Backbone.View tagName: 'i'

      Router = new RouterLoader @postsStub, @postsViewStub, @postViewStub, @headerViewStub, @postTeaserViewStub
      @appEl = $ '<div>'
      @headerEl = $ '<header>'
      @leftEl = $ '<div>'
      @rightEl = $ '<div>'
      @router = new Router appEl: @appEl, headerEl: @headerEl, leftEl: @leftEl, rightEl: @rightEl
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
