define ['backbone'], (Backbone) ->
  Todo = Backbone.Model.extend
    defaults:
      published: false
