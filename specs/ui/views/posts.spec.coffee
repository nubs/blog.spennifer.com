define ['views/posts'], (PostsViewLoader) ->
  describe 'Posts view', ->
    beforeEach ->
      @postViewStub = sinon.stub()
      @post1 = new Backbone.Model id: 1
      @post2 = new Backbone.Model id: 2
      @post3 = new Backbone.Model id: 3

      PostsView = new PostsViewLoader @postViewStub
      @view = new PostsView app: 'app', collection: new Backbone.Collection [@post1, @post2, @post3]

    describe 'when instantiated', ->
      it 'should create a list element', ->
        expect(@view.el.nodeName).toEqual 'UL'

      it 'should have a class of "posts"', ->
        expect(@view.$el).toHaveClass 'posts'

    describe 'when rendered', ->
      beforeEach ->
        @postView = new Backbone.View
        @postView.render = ->
          @el = document.createElement 'li'
          this
        @postViewRenderSpy = sinon.spy @postView, 'render'
        @postViewStub.returns @postView
        @view.render()

      it 'should create a post view for each item in the collection', ->
        expect(@postViewStub).toHaveBeenCalledThrice()
        expect(@postViewStub).toHaveBeenCalledWith model: @post1, app: 'app'
        expect(@postViewStub).toHaveBeenCalledWith model: @post2, app: 'app'
        expect(@postViewStub).toHaveBeenCalledWith model: @post3, app: 'app'

      it 'should render each post view', ->
        expect(@postViewRenderSpy).toHaveBeenCalledThrice()

      it 'should append each post to the list', ->
        expect(@view.$el.children().length).toEqual 3
