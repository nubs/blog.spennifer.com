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

require ['jquery', 'backbone', 'routers/router', 'collections/posts', 'views/posts', 'models/post', 'views/post', 'views/postTeaser', 'views/header'], ($, Backbone, RouterLoader, PostsLoader, PostsViewLoader, PostLoader, PostViewLoader, PostTeaserViewLoader, HeaderViewLoader) ->
  Post = new PostLoader
  PostView = new PostViewLoader
  PostTeaserView = new PostTeaserViewLoader
  Posts = new PostsLoader Post
  PostsView = new PostsViewLoader PostTeaserView
  HeaderView = new HeaderViewLoader

  Router = new RouterLoader Posts, PostsView, PostView, HeaderView, PostTeaserView
  router = new Router
    appEl: $ '#app'
    headerEl: $ '#pageHeader'
    leftEl: $ '#leftSidebar'
    rightEl: $ '#rightSidebar'

  Backbone.history.start pushState: true
