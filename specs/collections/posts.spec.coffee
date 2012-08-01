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
