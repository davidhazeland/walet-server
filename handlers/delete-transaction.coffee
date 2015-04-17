transaction = require '../services/transaction'

handler = 
	handle: (data, cb) ->
		callback = () ->
			cb 'Delete successful'
		transaction.delete data, callback

module.exports = handler