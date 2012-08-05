define ['views/posts'], (PostsView) ->
  describe 'Posts view', ->
    beforeEach ->
      @view = new PostsView

    describe 'when instantiated', ->
      it 'should create a list element', ->
        expect(@view.el.nodeName).toEqual 'UL'

      it 'should have a class of "posts"', ->
        expect(@view.$el).toHaveClass 'posts'
