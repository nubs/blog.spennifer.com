module.exports = (mongoose) ->
  express = require 'express'
  api = express()
  api.use express.json()

  Post = require('./models/post') mongoose

  api.get '/posts', (req, res) ->
    Post.find (err, posts) ->
      res.send posts

  api.get '/posts/:id', (req, res) ->
    Post.findOne _id: req.params.id, (err, post) ->
      res.send post

  api.post '/posts', (req, res) ->
    post = new Post
      title: req.body.title
    post.save (err, post) ->
      res.send post

  api
