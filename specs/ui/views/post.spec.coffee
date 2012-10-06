define ['views/post'], (PostViewLoader) ->
  describe 'Post view', ->
    beforeEach ->
      PostView = new PostViewLoader
      @model = new Backbone.Model
        _id: 1
        title: 'A blog post'
        body: '<p>Sample body</p>'
        teaser: 'Sample teaser'
        published: false
      @view = new PostView model: @model

    describe 'root element', ->
      it 'should be an article', ->
        expect(@view.$el).toBe 'article'

    describe 'when rendered', ->
      beforeEach ->
        @renderResult = @view.render()

      it 'should return the view object', ->
        expect(@renderResult).toEqual @view

      it 'should have a heading', ->
        expect(@view.$el).toContain 'h2'

      it 'should have the correct title text', ->
        expect(@view.$ 'h2').toHaveText 'A blog post'

      it 'should have the correct body element', ->
        expect(@view.$ '> p').toHaveText 'Sample body'
