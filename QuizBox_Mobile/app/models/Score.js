let db = require('../config/database')

exports.getScoresByQuizzId = (id_quizz, done) => {
	db.get().query('SELECT * FROM score WHERE id_quizz = ? ORDER BY score DESC', id_quizz, (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}

exports.storeScore = (data, done) => {
	db.get().query('INSERT INTO score (id_quizz, pseudo, score) VALUES (?, ?, ?)', [
		data.id_quizz,
		data.pseudo,
		data.score
	], (err, result) => {
		if (err) throw err
		done(null, result.insertId)
	})
}