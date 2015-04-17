express = require 'express'
router = express.Router()
transaction = require '../services/transaction'
AddTransactionHandler = require '../handlers/add-transaction'
FetchTransactionHandler = require '../handlers/fetch-transaction'

# GET transactions listing.
router.get '/', (req, res) ->
	callback = (transactions) ->
		res.json
			success: true
			data: transactions
	query = req.query
	FetchTransactionHandler.handle query, callback

# ADD transaction into database
router.post '/', (req, res) ->
	callback = (message) ->
		res.json
			success: true
			message: message
	data = req.body
	AddTransactionHandler.handle data, callback

module.exports = router
