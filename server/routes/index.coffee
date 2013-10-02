User = require '../models/user'

module.exports = (app) ->
  app.get '*', (req, res, next) ->
    if req.user
      console.log 'WE HAVE A USER! - ' + req.user
    else
      console.log 'NO USER!'
    next()

  app.post '/api/users', (req, res) ->
    console.log req.body
    User.register new User({
      username: req.body.user.username
      name: req.body.user.name
      email: req.body.user.email
    }), 
      req.body.user.password,
      (err, account) ->
        if err
          console.log err
          res.send 500
        else
          req.login account, (err) ->
            if err
              console.log err
            
            account.save (err) ->
              if err
                console.log "login error: #{err}"
              else
                console.log "registered: #{account}"
                res.send 200

 
