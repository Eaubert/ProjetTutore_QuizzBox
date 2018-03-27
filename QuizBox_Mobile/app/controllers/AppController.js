let rooms = [
	{ 
		id: '881baf7c-0221-11e8-ba89-0ed5f89f718b',
		name: 'Channel 1',
		pwd: '123',
		capacity: 4,
		clients: []
	},
	{ 
		id: '915aa431-802f-434a-991c-65f7ddbb9f9c',
		name: 'Channel 2',
		pwd: null,
		capacity: 2,
		clients: []
	},
]

let question = {
	id: '881baf7c-11e8-ba89-0221-0ed5f89f718b',
	question: "De quelle couleur est le cheval blanc d'Henri IV ?",
	answers: [
		{
			id: '915aa431-434a-802f-991c-65f7ddbb9f9c',
			answer: 'Noir'
		},
		{
			id: '915aa431-802f-991c-434a-65f7ddbb9f9c',
			answer: 'Blanc'
		},
		{
			id: '915aa431-434a-991c-802f-65f7ddbb9f9c',
			answer: 'Marron'
		}
	]
}

let clients = []

exports.getHome = (req, res) => {
	res.render('app/index.html.twig', { rooms })
}

exports.getChannel = (channel_id) => {
	return rooms.filter((channel) => {
		return (channel.id == channel_id)
	})[0]
}

exports.getClient = (client_id) => {
	return clients.filter((c) => {
		return (c.client_id = client_id)
	})[0]
}

exports.removeClient = (channel, client_id) => {
	// Parcourt de la liste des clients
	clients.forEach((v, k) => {

		// Si le client est trouvé
		if (v.client_id == client_id) {
			
			// Suppression du client dans la liste
			clients.splice(k, 1)

			// Parcourt de la liste des clients du channel
			channel.clients.forEach((v, k) => {
				
				// Si le client est trouvé
				if (v.client_id == client_id) {

					// Suppression du client dans la liste du channel
					channel.clients.splice(k, 1)
				}
			})
		}
	})
}

exports.addClient = (socket, channel) => {
	// Ajouts du client dans une liste de tous les clients
	clients.push({ 
		client_id: socket.client.id, 
		channel_id: channel.id 
	})

	// Ajouts du client dans la liste des clients du channel
	channel.clients.push({ 
		client_id: socket.client.id, 
		socket, 
		status: 'WAITING'
	})

	console.log(`Client enter in channel : ${channel.name}`)
}

exports.getClientByChannel = (channel, client_id) => {
	return channel.clients.filter((c) => {
		return (c.client_id == client_id)
	})[0]
}

exports.clientsAreReady = (channel) => {
	let ready = 0
	let totalClients = Object.keys(channel.clients).length
	channel.clients.forEach((v, k) => {
		if (v.status === 'READY') {
			ready = (ready + 1)
		}
	})
	return (ready == totalClients)
}

exports.sendQuestion = (clients) => {
	clients.forEach((v, k) => {
		v.socket.emit('question', question)
	})
}