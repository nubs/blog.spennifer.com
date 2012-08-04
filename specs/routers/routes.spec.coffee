define ['routers/router'], (Router) ->
  describe 'Routes', ->
    beforeEach ->
      @router = new Router
      @routeSpy = sinon.spy()
      try Backbone.history.start silent: true

      @router.navigate 'elsewhere'

    it 'defaults to the index route', ->
      @router.bind 'route:index', @routeSpy
      @router.navigate '', true
      expect(@routeSpy).toHaveBeenCalledOnce()
      expect(@routeSpy).toHaveBeenCalledWith()

    it 'routes to the posts detail page', ->
      @router.bind 'route:post', @routeSpy
      @router.navigate 'posts/1', true
      expect(@routeSpy).toHaveBeenCalledOnce()
      expect(@routeSpy).toHaveBeenCalledWith '1'
