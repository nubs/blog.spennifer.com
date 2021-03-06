define ['views/postTeaser'], (PostTeaserViewLoader) ->
  describe 'Post teaser view', ->
    beforeEach ->
      PostTeaserView = new PostTeaserViewLoader
      @model = new Backbone.Model
        _id: 1
        title: 'A blog post'
        body: '<p>Sample body</p>'
        teaser: 'Sample teaser'
        published: false
      @view = new PostTeaserView model: @model

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
        expect(@view.$('a').attr 'href').toEqual '/posts/1'

      it 'should have the correct title text', ->
        expect(@view.$ 'h2').toHaveText 'A blog post'

      it 'should have the correct body element', ->
        expect(@view.$ 'article').toHaveText 'Sample teaser'
