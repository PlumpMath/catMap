User = require '../models/user'

module.exports = (app) ->
  app.get '*', (req, res, next) ->
    if req.user
      console.log 'WE HAVE A USER! - ' + req.user
    else
      console.log 'NO USER!'
    next()


