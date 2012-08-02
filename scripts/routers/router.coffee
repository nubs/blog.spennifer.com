define ['backbone'], (Backbone) ->
  Router = Backbone.Router.extend
    routes:
      '': 'index'
    index: ->
