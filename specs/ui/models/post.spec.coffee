define ['models/post', '../fixtures/post', '../helpers/helpers'], (PostLoader, PostFixtures, Helpers) ->
  describe 'Post model', ->
    beforeEach ->
      Post = new PostLoader
      @post = new Post title: PostFixtures.valid[0].title
      @post.collection = url: '/collection'

    describe 'when instantiated', ->
      it 'should exhibit attributes', ->
        expect(@post.get 'title').toEqual PostFixtures.valid[0].title

      it 'should not be published', ->
        expect(@post.get 'published').toBe false

      it 'should use mongo ids', ->
        expect(@post.idAttribute).toBe '_id'

    describe 'when saving', ->
      beforeEach ->
        @server = sinon.fakeServer.create()
        @server.respondWith 'POST', '/collection', Helpers.validResponse PostFixtures.valid[0]
        @eventSpy = sinon.spy()

      afterEach -> @server.restore()

      it 'should make a save request to the server', ->
        @post.save()
        expect(@server.requests[0].method).toEqual 'POST'
        expect(@server.requests[0].url).toEqual '/collection'
        expect(JSON.parse(@server.requests[0].requestBody)).toEqual @post.attributes

      it 'should fail when title is empty', ->
        @post.bind 'error', @eventSpy
        @post.save title: ''
        expect(@eventSpy).toHaveBeenCalledOnce()
        expect(@eventSpy).toHaveBeenCalledWith @post, 'Post cannot have an empty title.'
