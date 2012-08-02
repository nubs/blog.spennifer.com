define ['routers/router'], (Router) ->
  describe 'Routes', ->
    beforeEach ->
      this.router = new Router
      this.routeSpy = sinon.spy()
      try Backbone.history.start silent: true

      this.router.navigate 'elsewhere'

    it 'defaults to the index route', ->
      this.router.bind 'route:index', this.routeSpy
      this.router.navigate '', true
      expect(this.routeSpy).toHaveBeenCalledOnce()
      expect(this.routeSpy).toHaveBeenCalledWith()

    it 'routes to the posts detail page', ->
      this.router.bind 'route:post', this.routeSpy
      this.router.navigate 'posts/1', true
      expect(this.routeSpy).toHaveBeenCalledOnce()
      expect(this.routeSpy).toHaveBeenCalledWith '1'
