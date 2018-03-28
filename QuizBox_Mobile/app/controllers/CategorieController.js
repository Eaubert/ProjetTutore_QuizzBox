const QuizzModel = require('../models/Quizz')
const CategorieModel = require('../models/Categorie')

exports.getCategories = (req, res) => {
	CategorieModel.getAll((a, categories) => {
		res.render('categorie/index.html.twig', { categories })
	})
}

exports.getQuizzs = (req, res) => {
	let id_categorie = req.params.id
	QuizzModel.getAllByCategorieId(id_categorie, (a, quizz) => {
		res.render('categorie/view.html.twig', { quizz })
	})
}

exports.getCategorie = (req, res) => {
	let id_categorie = req.params.id
	CategorieModel.getById(id_categorie, (e, categorie) => {
		QuizzModel.getAllByCategorieId(id_categorie, (e, quizz) => {
			res.render('categorie/view.html.twig', { categorie, quizz })
		})
	})
}