window.QuizzBoxManager = (() => {

	let module = {}

	module.QuizzBox = class QuizzBox {
		constructor() {
			this.socket = io()

			this.score = 0
			
			$('a#enterInRoom').on('click', (e) => {
				e.preventDefault()
				// Recuperation de l'id de la salle et envois au serveur
				let roomId = $(e.currentTarget).attr('quizzbox-data')
				this.socket.emit('enterInRoom', roomId)
				return false
			})

			// Si la salle n'existe pas, on affiche une alert au client
			this.socket.on('roomDoesNotExist', (msg) => {
				$('.section #flash').remove()
				$('.section').prepend($("<div></div>").text(msg).attr('id', 'flash').addClass('card-panel red white-text'))
			})

			// Si un mot de passe est nécessaire pour entrer dans la salle, on ouvre un modal
			this.socket.on('passwordNeeded', (roomId) => {
				$('.section #flash').remove()
				$('#modalPwd').modal('open')

				// Clic du bouton envoyer du modal
				$('a#sendPassword').on('click', (e) => {
					e.preventDefault()

					// Envois de l'id de la salle et du mot de passe
					this.socket.emit('password', {
						roomId: roomId,
						password: $('#mdp').val()
					})

					return false
				})
			})

			// On affiche le message d'erreur sur le mot de passe
			this.socket.on('passwordNeededAfterFail', (msg) => {
				$('#pwdFail').append($('<div></div><br/ >').text(msg).addClass('card-panel red white-text'))
				$('#mdp').val('')
			})

			this.socket.on('redirectToRoom', (route) => {
				window.location.replace(route)
			})

			$('a#ready').on('click', (e) => {
				e.preventDefault()
				this.socket.emit('ready', $(e.currentTarget).attr('quizzbox-data'))
			})

			this.socket.on('playersReady', (playersReady) => {
				$('#playersReady').text(playersReady)
			})

			this.socket.on('questions', (gameConfig) => {
				$('#waiting').remove()
				this.runGame(gameConfig, 0)
			})

			this.socket.on('goToScores', (route) => {
				window.location.replace(route)
			})
		}

		runGame(gameConfig, q) {
			if (q >= gameConfig.questions.length) {
				$('#game').remove()

				$('#endGame').fadeIn('slow')
				$('#endScore').text(this.score)

				$('#sendScore').on('click', (e) => {
					e.preventDefault()

					this.socket.emit('storeScore', {
						id_quizz: gameConfig.id_quizz,
						score: this.score,
						pseudo: $('#pseudo').val()
					})
				})
			} else {
				$('#score').text(this.score)
				$('#answers a').remove()

				let question = gameConfig.questions[q]

				$('#question').text(`${(q + 1)} - ${question.question}`)

				let answers = [question.rep1, question.rep2, question.rep3, question.repb]
				answers.sort(() => { return (0.5 - Math.random()) })

				answers.forEach((answer) => {
					$('#answers').append(
						$('<a></a>')
						.addClass('waves-effect waves-light btn')
						.text(answer)
						.addClass('answer')
						.attr('id', (answer == question.repb) ? 'repb' : '')
						.on('click', (e) => {
							e.preventDefault()
							if ($(e.currentTarget).attr('id') == "repb") {
								$(e.currentTarget).addClass('green')
								this.nexQuestion(gameConfig, q, true)
							} else {
								$('#repb').addClass('green')
								$(e.currentTarget).addClass('red')
								this.nexQuestion(gameConfig, q, false)
							}
						})
					)
				})

				this.time = gameConfig.time
				$('#timeLeft').text(this.time)

				$('#game').fadeIn('slow', () => {
					this.interval = setInterval(() => {
						this.time = (this.time - 1)
						if (this.time <= 0) {
							clearInterval(this.interval)
							this.runGame(gameConfig, (q + 1))
						}
						$('#timeLeft').text(this.time)
					}, 1000)
				})
			}
		}

		nexQuestion(gameConfig, q, repb) {
			$('a.answer').off('click')
			clearInterval(this.interval)
			if (repb) {
				let score = gameConfig.scores.find((data) => {
					return (this.time >= data.time)
				})
				this.score = (this.score + score.score)
				$('#score').text(this.score)

				this.timer = gameConfig.time
			}
			setTimeout(() => {
				this.runGame(gameConfig, (q + 1))
			}, (gameConfig.interval * 1000))
		}
	}

	return module
})()

$(() => {
	$('.modal').modal()
	$('.button-collapse').sideNav()
	let client = new QuizzBoxManager.QuizzBox()
})
