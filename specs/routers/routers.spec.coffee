postsStub = sinon.stub()
postsViewStub = sinon.stub()
context = createContext 'views/posts': 'stubviews/posts', 'collections/posts': 'stubcollections/posts'
define 'stubviews/posts', [], -> postsViewStub
define 'stubcollections/posts', [], -> postsStub

context ['backbone', 'routers/router'], (Backbone, Router) ->
  describe 'Router', ->
    beforeEach ->
      @collection = new Backbone.Collection
      postsStub.returns @collection
      postsViewStub.returns new Backbone.View
      @router = new Router

    describe 'Index handler', ->
      beforeEach ->
        @router.index()

      it 'should create a posts collection', ->
        expect(postsStub).toHaveBeenCalledWith()

      it 'should create a post list view', ->
        expect(postsViewStub).toHaveBeenCalledWith collection: @collection
