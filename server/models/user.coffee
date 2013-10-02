mongoose = require 'mongoose'
passportLocalMongoose = require 'passport-local-mongoose'
Schema = mongoose.Schema

User = new Schema {
  name: String
  email: String
}

User.plugin passportLocalMongoose

module.exports = mongoose.model 'User', User
