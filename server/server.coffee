express = require 'express'
flash = require 'connect-flash'
http = require 'http'
LocalStrategy = require('passport-local').Strategy
passport = require 'passport'
mongoose = require 'mongoose'
MongoStore = require('connect-mongo')(express)
routes = require './routes'
Cat = require './models/cat'

app = module.exports = express()
server = http.createServer app

io = require('socket.io').listen server
passportSocketIo = require 'passport.socketio'

io.on 'connection', (socket) ->
  console.log "hello"

mongoose.connect 'mongodb://catman:catman@ds047438.mongolab.com:47438/catmap', (err) ->
  if err
    console.log err
  else
    console.log 'connected to db'

# configuration
app.configure ->
  app.set 'views', __dirname + '/views'
  app.set 'view engine', 'jade'
  app.set 'view options', { layout: false }
  app.use express.bodyParser()
  app.use express.cookieParser 'catmaps are awesome'
  app.use express.methodOverride()
  app.use passport.initialize()
  app.use flash()
  app.use express.static __dirname + '/../public/'
  app.use app.router
  app.use (req, res) ->
    res.render 'app/index'

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

require('./routes/index')(app)

app.startServer = (port) ->
  server.listen port, ->
    console.log 'Express server started on port %d in %s mode',
      port, app.settings.env
