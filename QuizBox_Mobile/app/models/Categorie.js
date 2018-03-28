let db = require('../config/database')

exports.getAll = (done) => {
	db.get().query('SELECT * FROM categorie', (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}

exports.getByQuizzId = (id_categorie, done) => {
	db.get().query('SELECT * FROM categorie WHERE id = ?', id_categorie, (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}

exports.getById = (id, done) => {
	db.get().query('SELECT * FROM categorie WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}