define ['backbone'], (Backbone) ->
  () ->
    Post = Backbone.Model.extend
      idAttribute: '_id'
      url: ->
        if @isNew() then '/api/posts' else '/api/posts/' + @get 'title'
      defaults:
        published: false
      validate: (attributes) ->
        return 'Post cannot have an empty title.' unless attributes.title
