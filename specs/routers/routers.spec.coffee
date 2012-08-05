postsStub = sinon.stub()
postsViewStub = sinon.stub()
context = createContext 'views/posts': 'stubviews/posts', 'collections/posts': 'stubcollections/posts'
define 'stubviews/posts', [], -> postsViewStub
define 'stubcollections/posts', [], -> postsStub

context ['backbone', 'routers/router'], (Backbone, Router) ->
  describe 'Router', ->
    beforeEach ->
      @router = new Router

    describe 'Index handler', ->
      beforeEach ->
        @collection = new Backbone.Collection
        @fetchStub = sinon.stub(@collection, 'fetch').returns null
        postsStub.returns @collection
        postsViewStub.returns new Backbone.View
        @router.index()

      it 'should create a posts collection', ->
        expect(postsStub).toHaveBeenCalledWith()

      it 'should create a posts view', ->
        expect(postsViewStub).toHaveBeenCalledWith collection: @collection

      it 'shoud fetch the posts collection from the server', ->
        expect(@fetchStub).toHaveBeenCalledOnce()
        expect(@fetchStub).toHaveBeenCalledWith()
