module.exports = (mongoose) ->
  express = require 'express'
  api = express()

  api.use express.json()
  api.use '/posts', require('./post') mongoose

  api
