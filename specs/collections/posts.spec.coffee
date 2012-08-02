define ['collections/posts', '../fixtures/post', '../helpers/helpers'], (Posts, PostFixtures, Helpers) ->
  describe 'Posts collection', ->
    beforeEach ->
      this.post1 = new Backbone.Model PostFixtures.valid[0]

      this.postStub = sinon.stub()
      this.postStub.returns this.post1

      this.posts = new Posts()
      this.posts.model = this.postStub

    describe 'when instantiated with a model literal', ->
      beforeEach ->
        this.posts.add PostFixtures.valid[0]

      it 'should have 1 model', ->
        expect(this.posts.length).toEqual 1
        expect(this.posts.get 1).toEqual this.post1

      it 'should have called the model constructor', ->
        expect(this.postStub).toHaveBeenCalledOnce()
        expect(this.postStub).toHaveBeenCalledWith PostFixtures.valid[0]

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
