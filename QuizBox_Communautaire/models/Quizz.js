var crypto = require('crypto');
var bcrypt = require('bcrypt-nodejs');
var bookshelf = require('../config/bookshelf');

var Quizz = bookshelf.Model.extend({
  tableName:'quizz',
  hasTimestamps: false
});

module.exports = Quizz;
