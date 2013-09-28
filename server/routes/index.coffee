module.exports = (app) ->
  app.get '*', (req, res, next) ->
    if req.user
      console.log 'WE HAVE A USER! - ' + req.user
    else
      console.log 'NO USER!'
    next()

  app.post '/api/users', (req, res) ->
    console.log "new user: #{req.body.user.name}"
    res.send 200

