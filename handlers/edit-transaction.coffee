transaction = require '../services/transaction'

handler = 
	handle: (data, cb) ->
		callback = () ->
			cb 'Edit successful'
		data.tag = '' if not data.tag
		data.date = new Date() if not data.date?
		data.date = new Date(data.date)
		transaction.edit data, callback

module.exports = handler