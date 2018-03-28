let mysql = require('mysql')
let async = require('async')

let prod = 'quizzbox'
let dev = 'quizzbox'

exports.mode = {
	dev,
	prod
}

let state = {
	pool: null,
	mode: null
}

exports.connect = (mode, done) => {
	state.pool = mysql.createPool({
		host: 'localhost',
		user: 'root',
		password: '',
		port: 3307,
		database: mode === exports.mode.prod ? prod : dev
	})

	state.mode = mode
	done()
}

exports.get = () => {
	return state.pool
}

exports.fixtures = (data, done) => {
	let pool = state.pool
	if (!pool) return done(new Error('Missing database connection.'))

	let names = Object.keys(data.tables)
	async.each(names, (name, cb) => {
		async.each(data.tables[name], (row, cb) => {
			let keys = Object.keys(row)
			let values = keys.map((key) => { 
				return "'" + row[key] + "'" 
			})

			pool.query('INSERT INTO ' + name + ' (' + keys.join(',') + ') VALUES (' + values.join(',') + ')', cb)
		}, cb)
	}, done)
}

exports.drop = (tables, done) => {
	let pool = state.pool
	if (!pool) return done(new Error('Missing database connection.'))

	async.each(tables, (name, cb) => {
		pool.query('DELETE * FROM ' + name, cb)
	}, done)
}