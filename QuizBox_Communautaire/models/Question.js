var crypto = require('crypto');
var bcrypt = require('bcrypt-nodejs');
var bookshelf = require('../config/bookshelf');

var Question = bookshelf.Model.extend({
  tableName:'question',
  hasTimestamps: false

});

module.exports = Question;
