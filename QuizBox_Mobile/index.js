let express = require('express')
let app = express();
let http = require('http').Server(app)
let io = require('socket.io')(http)

let port = process.env.PORT || 3000

app.use(express.static(__dirname))
app.set('views', __dirname + '/app/views')

const AppController = require('./app/controllers/AppController')

app.get('/', (req, res) => {
	AppController.getHome(req, res)
})

// Evenement de connexion du client
io.on('connection', (socket) => {
	console.log('Client connected')

	let client = socket.client

	socket.on('enterChannel', (channel_id) => {
		// Recherche du channel
		let channel = AppController.getChannel(channel_id)

		// Si le channel existe
		if (channel !== undefined) {
			
			// Vérification du nombre de places restantes
			if (!(Object.keys(channel.clients).length == channel.capacity)) {

				// Récuperation du client dans le channel
				let c = AppController.getClientByChannel(channel, client.id)

				// Si le client n'est pas dans le channel on l'ajoute
				if (c === undefined) {
					
					// Vérification d'un mot de passe sur le channel
					if (channel.pwd !== null) {

						// Demande du mot de passe au client
						socket.emit('passwordNeeded', channel_id)

						console.log(`Password needed for ${channel.name}`)
					} else {
						// Ajouts du client dans une liste de tous les clients et dans la liste des clients du channel
						AppController.addClient(socket, channel)

						// Dit au client qu'il est dans le channel
						socket.emit('inChannel', channel_id)
					}
				}
			} else {
				// Envoi du message au client
				socket.emit('channelFull', `${channel.name} is full !`)
			}
		} else {
			// Envoi du message au client
			socket.emit('channelNotFound', 'Room not found !')
		}
	})

	// Evenement de mot de passe
	socket.on('sendPasswordChannel', (data) => {
		// Recherche du channel
		let channel = AppController.getChannel(data.channel_id)

		// Si le channel existe
		if (channel !== undefined) {

			// Vérification du mot de passe
			if (channel.pwd == data.pwd) {

				// Ajout du client a la liste des clients et a la liste des clients du channel
				AppController.addClient(socket, channel)

				// Dit au client qu'il est dans le channel
				socket.emit('inChannel', channel_id)
			} else {
				// Envoi du message
				socket.emit('wrongPassword', 'Wrong password !')
			}
		}
	})

	// Evenement de quand le client est prêt
	socket.on('sendReady', (data) => {
		// Recherche du channel
		let channel = AppController.getChannel(data.channel_id)

		// Si le channel existe
		if (channel !== undefined) {
			// Récuperation du client dans le channel
			let c = AppController.getClientByChannel(channel, client.id)

			// Si le client est dans le channel on change son statut
			if (c !== undefined) {
				c.status = 'READY'

				// On vérifie que tous les clients du channel son ready
				if (AppController.clientsAreReady(channel)) {

					// Envois des questions avec réponses a tous les clients
					AppController.sendQuestion(channel.clients)
				}
			} else {
				socket.emit('clientNotFound', 'Client not found in channel !')
			}
		} else {
			// Envoi du message au client
			socket.emit('channelNotFound', 'Room not found !')
		}
	})

	// Evenement de déconnexion du client
	socket.on('disconnect', () => {
		// Vérification de la connexion du client
		let c = AppController.getClient(client.id)

		if (c !== undefined) {
			// Recherche du channel
			let channel = AppController.getChannel(c.channel_id)

			// Vérification de l'existance du channel
			if (channel !== undefined) {

				// Récuperation du client dans le channel
				let cc = AppController.getClientByChannel(channel, c.client_id)

				// Si le client est dans le channel
				if (cc !== undefined) {

					// Suppression du client dans la liste des clients et dans la lsite des clients du channel
					AppController.removeClient(channel, c.client_id)
					
					console.log('Client disconnected')
				} else {
					// Envoi du message au client
					socket.emit('clientNotFound', 'Client not found !')
				}
			} else {
				// Envoi du message au client
				socket.emit('channelNotFound', 'Room not found !')
			}
		} else {
			// Envoi du message au client
			socket.emit('clientNotFound', 'Client not found !')
		}
	})
})

http.listen(port, () => {
	console.log(`Listening on http://localhost:${port}`)
})