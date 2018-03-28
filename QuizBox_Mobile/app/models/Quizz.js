let db = require('../config/database')

exports.getAll = (done) => {
	db.get().query('SELECT * FROM quizz', (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}

exports.getById = (id, done) => {
	db.get().query('SELECT * FROM quizz WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}

exports.getAllByCategorieId = (id, done) => {
	db.get().query('SELECT * FROM quizz WHERE id_categorie = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}