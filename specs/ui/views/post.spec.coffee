define ['views/post'], (PostView) ->
  describe 'Post view', ->
    beforeEach ->
      @model = new Backbone.Model
        id: 1
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
        expect(@view.$('a').attr 'href').toEqual '#post/1'

      it 'should have the correct title text', ->
        expect(@view.$ 'h2').toHaveText 'A blog post'