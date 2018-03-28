let db = require('../config/database')

exports.removeAllRooms = (done) => {
	db.get().query('DELETE FROM room', (err, res) => {
		if (err) return done(err)
		done(null, res)
	})
}

exports.create = (data, done) => {
	db.get().query('INSERT INTO room (nom, capacite, joueurs, mdp, id_quizz) VALUES (?, ?, ?, ?, ?)', [
		data.nom,
		data.capacite,
		data.joueurs,
		data.mdp,
		data.id_quizz
	], (err, result) => {
		if (err) throw err
		done(null, result.insertId)
	})
}

exports.getAllByQuizzId = (id, done) => {
	db.get().query('SELECT * FROM room WHERE id_quizz = ? AND capacite > joueurs', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows)
	})
}

exports.getById = (id, done) => {
	db.get().query('SELECT * FROM room WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}

exports.updateJoueurs = (id, done) => {
	db.get().query('UPDATE room SET joueurs = (joueurs + 1) WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}

exports.updateJoueurPret = (id, done) => {
	db.get().query('UPDATE room SET joueurs_pret = (joueurs_pret + 1) WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}

exports.clientsAreReady = (id, done) => {
	db.get().query('SELECT capacite, joueurs_pret FROM room WHERE id = ?', id, (err, rows) => {
		if (err) return done(err)
		done(null, rows[0])
	})
}