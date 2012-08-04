# This stub is unfortunately global to this spec.  I can't find a way to keep
# that from being the case.  The models/post module needs to be defined before
# the collections/post module is loaded, and putting it first means that the
# stub has to be global.
postStub = sinon.stub()
context = createContext 'models/post': 'stubmodels/post'
define 'stubmodels/post', [], -> postStub

context ['backbone', '../specs/fixtures/post', '../specs/helpers/helpers', 'collections/posts'], (Backbone, PostFixtures, Helpers, Posts) ->
  describe 'Posts collection', ->
    beforeEach ->
      this.post1 = new Backbone.Model PostFixtures.valid[0]
      postStub.returns this.post1
      this.posts = new Posts()

    describe 'when instantiated with a model literal', ->
      beforeEach ->
        this.posts.add PostFixtures.valid[0]

      it 'should have 1 model', ->
        expect(this.posts.length).toEqual 1
        expect(this.posts.get 1).toEqual this.post1

      it 'should have called the model constructor', ->
        expect(postStub).toHaveBeenCalledWith PostFixtures.valid[0]

    describe 'when fetching from server', ->
      beforeEach ->
        this.server = sinon.fakeServer.create()
        this.server.respondWith 'GET', '/posts', Helpers.validResponse PostFixtures.valid

      afterEach -> this.server.restore()

      it 'should make the correct request', ->
        this.posts.fetch()
        expect(this.server.requests.length).toEqual 1
        expect(this.server.requests[0].method).toEqual 'GET'
        expect(this.server.requests[0].url).toEqual '/posts'

      it 'should parse the posts from the response', ->
        this.posts.fetch()
        this.server.respond()
        expect(this.posts.toJSON()).toEqual PostFixtures.valid
