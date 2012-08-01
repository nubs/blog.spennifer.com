define ['models/post', '../fixtures/post', '../helpers/helpers'], (Post, PostFixtures, Helpers) ->
  describe 'Post model', ->
    beforeEach ->
      this.post = new Post title: PostFixtures.valid[0].title
      this.post.collection = url: '/collection'

    describe 'when instantiated', ->
      it 'should exhibit attributes', ->
        expect(this.post.get 'title').toEqual PostFixtures.valid[0].title

      it 'should not be published', ->
        expect(this.post.get 'published').toBe false

    describe 'when saving', ->
      beforeEach ->
        this.server = sinon.fakeServer.create()
        this.server.respondWith 'POST', '/collection', Helpers.validResponse PostFixtures.valid[0]

      afterEach -> this.server.restore()

      it 'should make a save request to the server', ->
        this.post.save()
        expect(this.server.requests[0].method).toEqual 'POST'
        expect(this.server.requests[0].url).toEqual '/collection'
        expect(JSON.parse(this.server.requests[0].requestBody)).toEqual this.post.attributes
