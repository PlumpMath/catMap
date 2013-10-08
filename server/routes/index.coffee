Cat = require '../models/cat'

mongoose = require 'mongoose'

module.exports = (app) ->

  app.get '/api/cats', (req, res) ->
    cats = Cat.find {}, (err, cats) ->
      catMap = []
      cats.forEach (cat) ->
        catMap.push cat

      catHash = { cats: catMap }
      console.log catHash
      res.send catHash
        

  app.get '/api/cats/:id', (req, res) ->
    Cat.findById req.params.id, (err, cat) ->
      if err
        console.log "Err retrieving cat"
      else
        res.send { cat: cat }

  app.post '/api/cats', (req, res) ->
    cat = req.body.cat
    location = cat.place.split(' ')

    newCat = new Cat {
      name: cat.name
      description: cat.description
      picture: cat.picture
      place: location
      profileStyle: cat.profileStyle
      created: cat.created
    }

    newCat.save (err) ->
      if err
        console.log "error creating new cat: #{err}"
      else
        console.log "#{newCat.name} created!"
        console.log newCat.id
        console.log { cat: newCat }
        res.send { cat: newCat }
