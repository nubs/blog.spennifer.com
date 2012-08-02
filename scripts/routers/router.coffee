define ['backbone'], (Backbone) ->
  Router = Backbone.Router.extend
    routes:
      '': 'index'
      'posts/:id': 'post'
    index: ->
    post: (id) ->
