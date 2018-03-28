const RoomModel = require('../models/Room')
const ScoreModel = require('../models/Score')
const QuestionModel = require('../models/Question')
const QuizzBoxConfig = require('../config/quizzbox')

let bcrypt = require('bcrypt')

exports.enterInRoom = (socket, roomId) => {
	RoomModel.getById(roomId, (e, room) => {
		if (room != undefined) {
			if (room.mdp.length > 0) {
				// On demande le mot de passe si il y en a un
				socket.emit('passwordNeeded', roomId)
			} else {
				redirectToRoom(socket, room)
			}
		} else {
			roomDoesNotExist(socket)
		}
	})
}

exports.checkPassword = (socket, data) => {
	RoomModel.getById(data.roomId, (e, room) => {
		if (room != undefined) {
			// Comparaison des mots de passe
			let equals = bcrypt.compareSync(data.password, room.mdp)
			if (!equals) {
				// On redemande le mot de passe au client
				socket.emit('passwordNeededAfterFail', 'Le mot de passe est incorrect.')
				socket.emit('passwordNeeded', data.roomId)
			} else {
				redirectToRoom(socket, room)
			}
		} else {
			roomDoesNotExist(socket)
		}
	})
}

exports.ready = (socket, roomId, io) => {
	RoomModel.getById(roomId, (e, room) => {
		if (room != undefined) {		
			if (room.joueurs_pret < room.capacite) {
				
				socket.join(roomId)

				RoomModel.updateJoueurPret(roomId, (e, row) => {
					room.joueurs_pret = (room.joueurs_pret + 1)
					if (room.joueurs_pret >= room.capacite) {
						QuestionModel.getQuestionsByQuizzId(room.id_quizz, (e, questions) => {
							let gameConfig = QuizzBoxConfig.gameVars()
							gameConfig.questions = questions
							gameConfig.id_quizz = room.id_quizz

							io.to(roomId).emit('questions', gameConfig)
						})
					} else {
						io.to(roomId).emit('playersReady', room.joueurs_pret)
					}
				})
			} 
		} else {
			roomDoesNotExist(socket)
		}
	})
}

exports.storeScore = (socket, data) => {
	ScoreModel.storeScore(data, (e, row) => {
		socket.emit('goToScores', `/quizz/scores/${data.id_quizz}`)
	})
}

redirectToRoom = (socket, room) => {
	socket.emit('redirectToRoom', `/room/${room.id}`)
}

roomDoesNotExist = (socket) => {
	socket.emit('roomDoesNotExist', 'La salle n\'existe pas.')
}