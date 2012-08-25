define ['backbone'], (Backbone) ->
  (Post) ->
    Posts = Backbone.Collection.extend
      model: Post
      url: '/api/posts'
