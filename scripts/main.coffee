require.config
  shim:
    underscore:
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    handlebars:
      exports: 'Handlebars'
  paths:
    jquery: 'https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min'
    underscore: 'http://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.3.3/underscore-min'
    backbone: 'http://cdnjs.cloudflare.com/ajax/libs/backbone.js/0.9.2/backbone-min'
    text: '../vendor/requirejs-text/text'
    handlebars: 'http://cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.0.0.beta6/handlebars.min'

require ['jquery', 'backbone', 'routers/router', 'collections/posts', 'views/posts', 'models/post', 'views/post'], ($, Backbone, RouterLoader, PostsLoader, PostsViewLoader, PostLoader, PostViewLoader) ->
  Post = new PostLoader
  PostView = new PostViewLoader
  Posts = new PostsLoader Post
  PostsView = new PostsViewLoader PostView

  Router = new RouterLoader Posts, PostsView, Post, PostView
  router = new Router appEl: $ '#app'
  Backbone.history.start()
