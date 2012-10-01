module.exports = (mongoose) ->
  express = require 'express'
  app = express()

  Post = require('./models/post') mongoose

  app.get '/', (req, res) ->
    Post.find (err, posts) ->
      res.send posts

  app.get '/:id', (req, res) ->
    Post.findOne _id: req.params.id, (err, post) ->
      res.send post

  app.post '/', (req, res) ->
    post = new Post
      title: req.body.title
      body: req.body.body
    post.save (err, post) ->
      res.send post

  app
