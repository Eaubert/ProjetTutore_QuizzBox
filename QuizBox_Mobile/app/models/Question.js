let db = require('../config/database')

exports.getQuestionsByQuizzId = (id_quizz, done) => {
	db.get().query('SELECT * FROM question WHERE id_quizz = ?', id_quizz, (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}