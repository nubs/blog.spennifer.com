define ['views/post'], (PostViewLoader) ->
  describe 'Post view', ->
    beforeEach ->
      PostView = new PostViewLoader
      @model = new Backbone.Model
        _id: 1
        title: 'A blog post'
        published: false
      @view = new PostView model: @model

    describe 'root element', ->
      it 'should be a list item', ->
        expect(@view.$el).toBe 'li'

    describe 'when rendered', ->
      beforeEach ->
        @renderResult = @view.render()

      it 'should return the view object', ->
        expect(@renderResult).toEqual @view

      it 'should have the correct element structure', ->
        expect(@view.$el).toContain 'a h2'

      it 'should have the correct URL', ->
        expect(@view.$('a').attr 'href').toEqual '#posts/1'

      it 'should have the correct title text', ->
        expect(@view.$ 'h2').toHaveText 'A blog post'
