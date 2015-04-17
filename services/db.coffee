connection = require './connection'

db = 
	query: (sql, callback) ->
		connection.connect

		connection.query sql, (err, rows, fields) ->
			if err 
				throw err
			callback rows

		connection.end

module.exports = db