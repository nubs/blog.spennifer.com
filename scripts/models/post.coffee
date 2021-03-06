define ['backbone'], (Backbone) ->
  () ->
    Post = Backbone.Model.extend
      idAttribute: '_id'
      urlRoot: '/api/posts'
      defaults:
        published: false
      validate: (attributes) ->
        return 'Post cannot have an empty title.' unless attributes.title
        return 'Post cannot have an empty body.' unless attributes.body
        return 'Post cannot have an empty teaser.' unless attributes.teaser
