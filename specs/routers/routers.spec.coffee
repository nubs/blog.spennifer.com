postsStub = sinon.stub()
postsViewStub = sinon.stub()
postStub = sinon.stub()
postViewStub = sinon.stub()
context = createContext 'views/posts': 'stubviews/posts', 'collections/posts': 'stubcollections/posts', 'views/post': 'stubviews/post', 'models/post': 'stubmodels/post'
define 'stubviews/posts', [], -> postsViewStub
define 'stubcollections/posts', [], -> postsStub
define 'stubviews/post', [], -> postViewStub
define 'stubmodels/post', [], -> postStub

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

    describe 'Post detail handler', ->
      beforeEach ->
        @post = new Backbone.Model
        postStub.returns @post
        postViewStub.returns new Backbone.View
        @router.post '1'

      it 'should create a post model', ->
        expect(postStub).toHaveBeenCalledWith id: '1'

      it 'should create a post view', ->
        expect(postViewStub).toHaveBeenCalledWith model: @post
