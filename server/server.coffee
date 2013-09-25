express = require 'express'
flash = require 'connect-flash'
LocalStrategy = require('passport-local').Strategy
passport = require 'passport'
mongoose = require 'mongoose'
MongoStore = require('connect-mongo')(express)
routes = require './routes'
User = require './models/user'

app = module.exports = express()
mongoose.connect 'mongodb://localhost/catmap', (err) ->
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
  app.use express.session {
    store: new MongoStore {
      url: 'mongodb://localhost/catmap'
    }
  }
  app.use passport.initialize()
  app.use passport.session()
  app.use flash()
  app.use express.static __dirname + '/../public/'
  app.use app.router
  app.use (req, res) ->
    res.render 'layout'

app.configure 'development', ->
  app.use express.errorHandler { dumpExceptions: true, showStack: true }

app.configure 'production', ->
  app.use express.errorHandler()

passport.use User.createStrategy()
passport.serializeUser (user, cb) ->
  cb null, user.email
passport.deserializeUser (email, cb) ->
  User.findByUsername email, cb

require('./routes/index')(app)

app.startServer = (port) ->
  app.listen port, ->
    console.log 'Express server started on port %d in %s mode',
      port, app.settings.env

