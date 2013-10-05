mongoose = require 'mongoose'
Schema = mongoose.Schema

Cat = new Schema {
  name: String
  location: Array 
  description: String
  picture: String
  profileStyle: String
  created: String
}

module.exports = mongoose.model 'Cat', Cat
