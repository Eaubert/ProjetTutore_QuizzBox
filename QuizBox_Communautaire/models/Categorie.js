var crypto = require('crypto');
var bcrypt = require('bcrypt-nodejs');
var bookshelf = require('../config/bookshelf');

var Categorie = bookshelf.Model.extend({
  tableName:'categorie',
  hasTimestamps: false
});

module.exports = Categorie;
