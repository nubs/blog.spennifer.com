define ['backbone', '../fixtures/post', '../helpers/helpers', 'collections/posts'], (Backbone, PostFixtures, Helpers, PostsLoader) ->
  describe 'Posts collection', ->
    beforeEach ->
      @post1 = new Backbone.Model PostFixtures.valid[0]
      @postStub = sinon.stub()
      @postStub.returns @post1
      Posts = new PostsLoader @postStub
      @posts = new Posts

    describe 'when instantiated with a model literal', ->
      beforeEach ->
        @posts.add PostFixtures.valid[0]

      it 'should have 1 model', ->
        expect(@posts.length).toEqual 1
        expect(@posts.get 1).toEqual @post1

      it 'should have called the model constructor', ->
        expect(@postStub).toHaveBeenCalledOnce()
        expect(@postStub).toHaveBeenCalledWith PostFixtures.valid[0]

    describe 'when fetching from server', ->
      beforeEach ->
        @server = sinon.fakeServer.create()
        @server.respondWith 'GET', '/api/posts', Helpers.validResponse PostFixtures.valid

      afterEach -> @server.restore()

      it 'should make the correct request', ->
        @posts.fetch()
        expect(@server.requests.length).toEqual 1
        expect(@server.requests[0].method).toEqual 'GET'
        expect(@server.requests[0].url).toEqual '/api/posts'

      it 'should parse the posts from the response', ->
        @posts.fetch()
        @server.respond()
        expect(@posts.toJSON()).toEqual PostFixtures.valid
