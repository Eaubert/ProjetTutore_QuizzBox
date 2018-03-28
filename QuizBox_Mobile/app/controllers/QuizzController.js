const QuizzModel = require('../models/Quizz')
const CategorieModel = require('../models/Categorie')
const RoomModel = require('../models/Room')
const ScoreModel = require('../models/Score')

exports.getCategories = (req, res) => {
	let quizz_id = req.params.id
	QuizzModel.getById(quizz_id, (e, quizz) => {
		CategorieModel.getByQuizzId(quizz_id, (e, categories) => {
			res.render('quizz/view.html.twig', { quizz, categories })
		})	
	})
}

exports.getRooms = (req, res) => {
	let quizz_id = req.params.id
	let flash = req.flash()
	QuizzModel.getById(quizz_id, (e, quizz) => {
		RoomModel.getAllByQuizzId(quizz_id, (e, rooms) => {
			res.render('room/index.html.twig', { quizz, rooms, success: flash.success, error: flash.error })
		})
	})
}

exports.getScores = (req, res) => {
	let quizz_id = req.params.id
	QuizzModel.getById(quizz_id, (e, quizz) => {
		ScoreModel.getScoresByQuizzId(quizz_id, (e, scores) => {
			res.render('quizz/scores.html.twig', { quizz, scores })
		})
	})
}