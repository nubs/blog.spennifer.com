define ['backbone'], (Backbone) ->
  () ->
    Post = Backbone.Model.extend
      idAttribute: '_id'
      defaults:
        published: false
      validate: (attributes) ->
        return 'Post cannot have an empty title.' unless attributes.title
