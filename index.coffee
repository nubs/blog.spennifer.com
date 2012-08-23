express = require 'express'
app = express()

mongoose = require 'mongoose'
mongoose.connect process.env.MONGOHQ_URL

api = require('./api') mongoose

app.use express.static __dirname + '/public'
app.use express.logger 'dev'
app.use '/api', api
app.use '/vendor', express.static __dirname + '/vendor'
app.use '/scripts', express.static __dirname + '/scripts'
app.use '/specs', express.static __dirname + '/specs'

app.listen 8000
