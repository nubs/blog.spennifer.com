define ['jquery', 'backbone', 'routers/router'], ($, Backbone, RouterLoader) ->
  describe 'Router', ->
    beforeEach ->
      @collection = new Backbone.Collection
      @post = new Backbone.Model

      @collectionFetchStub = sinon.stub(@collection, 'fetch').returns null
      @postsStub = sinon.stub().returns @collection

      @postsViewStub = sinon.stub().returns new Backbone.View tagName: 'b'
      @postViewStub = sinon.stub().returns new Backbone.View tagName: 'hr'
      @headerViewStub = sinon.stub().returns new Backbone.View tagName: 'h1'
      @postTeaserViewStub = sinon.stub().returns new Backbone.View tagName: 'i'

      Router = new RouterLoader @postsStub, @postsViewStub, @postViewStub, @headerViewStub, @postTeaserViewStub
      @appEl = $ '<div>'
      @headerEl = $ '<header>'
      @leftEl = $ '<div>'
      @rightEl = $ '<div>'
      @router = new Router appEl: @appEl, headerEl: @headerEl, leftEl: @leftEl, rightEl: @rightEl

    describe 'Index handler', ->
      beforeEach ->
        @router.index()

      it 'should create a posts collection', ->
        expect(@postsStub).toHaveBeenCalledOnce()
        expect(@postsStub).toHaveBeenCalledWith()

      it 'should create a posts view', ->
        expect(@postsViewStub).toHaveBeenCalledOnce()
        expect(@postsViewStub).toHaveBeenCalledWith collection: @collection, app: @router

      it 'should create a header view', ->
        expect(@headerViewStub).toHaveBeenCalledOnce()
        expect(@headerViewStub).toHaveBeenCalledWith el: @headerEl, app: @router

      it 'shoud fetch the posts collection from the server', ->
        expect(@collectionFetchStub).toHaveBeenCalledOnce()
        expect(@collectionFetchStub).toHaveBeenCalledWith()

      it 'should add the posts view to the application element.', ->
        expect(@appEl).toContain 'b'

    describe 'Post detail handler', ->
      beforeEach ->
        @router.post '1'

      it 'should create a posts collection', ->
        expect(@postsStub).toHaveBeenCalledOnce()
        expect(@postsStub).toHaveBeenCalledWith()

      it 'should create a header view', ->
        expect(@headerViewStub).toHaveBeenCalledOnce()
        expect(@headerViewStub).toHaveBeenCalledWith el: @headerEl, app: @router

      it 'should fetch the posts collection from the server', ->
        expect(@collectionFetchStub).toHaveBeenCalledOnce()
        expect(@collectionFetchStub).toHaveBeenCalledWith()
