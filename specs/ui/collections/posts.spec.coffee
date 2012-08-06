# This stub is unfortunately global to this spec.  I can't find a way to keep
# that from being the case.  The models/post module needs to be defined before
# the collections/post module is loaded, and putting it first means that the
# stub has to be global.
postStub = sinon.stub()
context = createContext 'models/post': 'stubmodels/post'
define 'stubmodels/post', [], -> postStub

context ['backbone', '../specs/ui/fixtures/post', '../specs/ui/helpers/helpers', 'collections/posts'], (Backbone, PostFixtures, Helpers, Posts) ->
  describe 'Posts collection', ->
    beforeEach ->
      @post1 = new Backbone.Model PostFixtures.valid[0]
      postStub.returns @post1
      @posts = new Posts()

    describe 'when instantiated with a model literal', ->
      beforeEach ->
        @posts.add PostFixtures.valid[0]

      it 'should have 1 model', ->
        expect(@posts.length).toEqual 1
        expect(@posts.get 1).toEqual @post1

      it 'should have called the model constructor', ->
        expect(postStub).toHaveBeenCalledWith PostFixtures.valid[0]

    describe 'when fetching from server', ->
      beforeEach ->
        @server = sinon.fakeServer.create()
        @server.respondWith 'GET', '/posts', Helpers.validResponse PostFixtures.valid

      afterEach -> @server.restore()

      it 'should make the correct request', ->
        @posts.fetch()
        expect(@server.requests.length).toEqual 1
        expect(@server.requests[0].method).toEqual 'GET'
        expect(@server.requests[0].url).toEqual '/posts'

      it 'should parse the posts from the response', ->
        @posts.fetch()
        @server.respond()
        expect(@posts.toJSON()).toEqual PostFixtures.valid
