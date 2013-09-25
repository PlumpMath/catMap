mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
Schema = mongoose.Schema

User = new Schema {
  cats: [
    {
      id: String
    }
  ]
}

User.plugin passportLocalMongoose

module.exports = mongoose.model 'User', User
