transaction = require '../services/transaction'

handler = 
	handle: (data, cb) ->
		callback = (rows) ->
			cb 
				id: rows.insertId
		data.tag = '' if not data.tag
		data.date = new Date() if not data.date?
		data.date = new Date(data.date)
		transaction.add data, callback

module.exports = handler
