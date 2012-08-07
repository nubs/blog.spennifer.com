define ['backbone'], (Backbone) ->
  () ->
    Post = Backbone.Model.extend
      defaults:
        published: false
      validate: (attributes) ->
        return 'Post cannot have an empty title.' unless attributes.title
