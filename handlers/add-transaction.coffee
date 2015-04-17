transaction = require '../services/transaction'

handler = 
	handle: (data, cb) ->
		callback = () ->
			cb 'Add successful'
		data.date = new Date() if not data.date?
		data.date = new Date(data.date)
		transaction.add data, callback

module.exports = handler
