let express = require('express')
let app = express()
let http = require('http').Server(app)
let io = require('socket.io')(http)

let port = process.env.PORT || 3000

const bodyParser = require('body-parser')
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))
app.use(express.static(__dirname))
app.set('views', __dirname + '/app/views')

let session = require('express-session')
app.use(session(
	{ 
		cookie: { 
			maxAge: 7200000 
		},
		secret: 'quizzbox',
		resave: true,
		saveUninitialized: true
	}
))

let flash = require('connect-flash')
app.use(flash())

const db = require('./app/config/database')
const AppController = require('./app/controllers/AppController')
const QuizzController = require('./app/controllers/QuizzController')
const CategorieController = require('./app/controllers/CategorieController')
const RoomController = require('./app/controllers/RoomController')

app.get('/', (req, res) => {
	CategorieController.getCategories(req, res)
})

app.get('/categorie/:id', (req, res) => {
	CategorieController.getCategorie(req, res)
})

app.get('/quizz/:id', (req, res) => {
	QuizzController.getRooms(req, res)
})

app.get('/quizz/scores/:id', (req, res) => {
	QuizzController.getScores(req, res)
})

app.get('/room/create/:id', (req, res) => {
	RoomController.createRoom(req, res)
})

app.post('/room/store/:id', (req, res) => {
	RoomController.storeRoom(req, res)
})

app.get('/room/:id', (req, res) => {
	RoomController.enter(req, res)
})

// Evenement de connexion du client
io.on('connection', (socket) => {
	socket.on('enterInRoom', (roomId) => {
		AppController.enterInRoom(socket, roomId)
	})

	socket.on('password', (data) => {
		AppController.checkPassword(socket, data)
	})

	socket.on('ready', (roomId) => {
		AppController.ready(socket, roomId, io)
	})

	socket.on('storeScore', (data) => {
		AppController.storeScore(socket, data)
	})
})

db.connect(db.mode.dev, (err) => {
	if (err) {
	 	console.log('Unable to connect to MySQL.')
	 	process.exit(1)
	} else {
		// on supprime toutes les rooms
		RoomController.removeAllRooms()
		http.listen(port, () => {
			console.log(`Listening on http://localhost:${port}`)
		})
	}
})