const { model, Schema } = require('mongoose');

module.exports = model('Users', new Schema({
  firstName: String,
  lastName: String,
  Avatar: String,
}))