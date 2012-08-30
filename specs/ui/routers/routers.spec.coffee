define ['backbone', 'routers/router'], (Backbone, RouterLoader) ->
  describe 'Router', ->
    beforeEach ->
      @collection = new Backbone.Collection
      @fetchStub = sinon.stub(@collection, 'fetch').returns null
      @postsStub = sinon.stub().returns @collection
      @postsViewStub = sinon.stub().returns new Backbone.View

      @post = new Backbone.Model
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
        expect(@fetchStub).toHaveBeenCalledOnce()
        expect(@fetchStub).toHaveBeenCalledWith()

    describe 'Post detail handler', ->
      beforeEach ->
        @router.post 'Test title'

      it 'should create a post model', ->
        expect(@postStub).toHaveBeenCalledOnce()
        expect(@postStub).toHaveBeenCalledWith title: 'Test title'

      it 'should create a post view', ->
        expect(@postViewStub).toHaveBeenCalledOnce()
        expect(@postViewStub).toHaveBeenCalledWith model: @post
