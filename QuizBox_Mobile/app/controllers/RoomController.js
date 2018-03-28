const CategorieModel = require('../models/Categorie')
const RoomModel = require('../models/Room')
const QuizzModel = require('../models/Quizz')

const AppController = require('./AppController')

let xss = require('xss')
let url = require('url')
let bcrypt = require('bcrypt')

exports.createRoom = (req, res) => {
	let flash = req.flash()
	res.render('room/create.html.twig', { id_quizz: req.params.id, success: flash.success, error: flash.error })
}

exports.storeRoom = (req, res) => {
	let nom = xss(req.body.nom)
	let capacite = req.body.capacite
	let mdp = xss(req.body.mdp)

	let errors = false

	if (nom == '') {
		error = true
		req.flash('error', { 'msg': 'Veuillez saisir un nom valide.' })
	}

	if (capacite <= 0) {
		error = true
		req.flash('error', { 'msg': 'Veuillez saisir un nombre de joueurs valide.' })
	}

	if (errors) {
		res.redirect(url.format({
			pathname: `/room/create/${req.params.id}`,
			query: {
				nom: nom,
				capacite: capacite,
				mdp: mdp
			}
		}))
	} else {
		let room = {
			nom: nom,
			capacite: capacite,
			joueurs: 0,
			mdp: (mdp.length > 0) ? bcrypt.hashSync(mdp, bcrypt.genSaltSync(10)) : '',
			id_quizz: req.params.id,
			clients: [],
			joueurs_pret: 0
		}
		RoomModel.create(room, (e, roomId) => {
			req.flash('success', { 'msg': 'Salle créée avec succès.' })
			res.redirect(url.format({
				pathname: `/quizz/${req.params.id}`
			}))
		})
	}
}

exports.enter = (req, res) => {
	RoomModel.getById(req.params.id, (e, room) => {
		if (room != undefined) {
			if (room.capacite > room.joueurs) {
				RoomModel.updateJoueurs(room.id, (e, data) => {
					QuizzModel.getById(room.id_quizz, (e, quizz) => {
						res.render('quizz/view.html.twig', { quizz, room })
					})
				})
			}
		} else {
			res.redirect('/')
		}
	})
}

exports.removeAllRooms = () => {
	RoomModel.removeAllRooms(() => {
		console.log('Rooms removed.')
	})
}