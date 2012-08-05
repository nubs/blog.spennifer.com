postViewStub = sinon.stub()
context = createContext 'views/post': 'stubviews/post'
define 'stubviews/post', [], -> postViewStub

context ['views/posts'], (PostsView) ->
  describe 'Posts view', ->
    beforeEach ->
      @view = new PostsView

    describe 'when instantiated', ->
      it 'should create a list element', ->
        expect(@view.el.nodeName).toEqual 'UL'

      it 'should have a class of "posts"', ->
        expect(@view.$el).toHaveClass 'posts'

    describe 'when rendered', ->
      beforeEach ->
        @postView = new Backbone.View
        postViewStub.returns @postView
        @post1 = new Backbone.Model id: 1
        @post2 = new Backbone.Model id: 2
        @post3 = new Backbone.Model id: 3
        @view.collection = new Backbone.Collection [@post1, @post2, @post3]
        @view.render()

      it 'should create a post view for each item in the collection', ->
        expect(postViewStub).toHaveBeenCalledWith model: @post1
        expect(postViewStub).toHaveBeenCalledWith model: @post2
        expect(postViewStub).toHaveBeenCalledWith model: @post3
