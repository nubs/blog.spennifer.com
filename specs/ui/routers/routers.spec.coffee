define ['backbone', 'routers/router'], (Backbone, RouterLoader) ->
  describe 'Router', ->
    beforeEach ->
      @collection = new Backbone.Collection
      @collectionFetchStub = sinon.stub(@collection, 'fetch').returns null
      @postsStub = sinon.stub().returns @collection
      @postsViewStub = sinon.stub().returns new Backbone.View

      @post = new Backbone.Model
      @postFetchStub = sinon.stub(@post, 'fetch').returns null
      @postStub = sinon.stub().returns @post
      @postViewStub = sinon.stub().returns new Backbone.View

      Router = new RouterLoader @postsStub, @postsViewStub, @postStub, @postViewStub
      @router = new Router

    describe 'Index handler', ->
      beforeEach ->
        @router.index()

      it 'should create a posts collection', ->
        expect(@postsStub).toHaveBeenCalledOnce()
        expect(@postsStub).toHaveBeenCalledWith()

      it 'should create a posts view', ->
        expect(@postsViewStub).toHaveBeenCalledOnce()
        expect(@postsViewStub).toHaveBeenCalledWith collection: @collection

      it 'shoud fetch the posts collection from the server', ->
        expect(@collectionFetchStub).toHaveBeenCalledOnce()
        expect(@collectionFetchStub).toHaveBeenCalledWith()

    describe 'Post detail handler', ->
      beforeEach ->
        @router.post 'Test title'

      it 'should create a post model', ->
        expect(@postStub).toHaveBeenCalledOnce()
        expect(@postStub).toHaveBeenCalledWith title: 'Test title'

      it 'should create a post view', ->
        expect(@postViewStub).toHaveBeenCalledOnce()
        expect(@postViewStub).toHaveBeenCalledWith model: @post

      it 'shoud fetch the post from the server', ->
        expect(@postFetchStub).toHaveBeenCalledOnce()
        expect(@postFetchStub).toHaveBeenCalledWith()
