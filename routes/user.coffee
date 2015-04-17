express = require 'express'
router = express.Router()
transaction = require '../services/transaction'

# GET transactions listing.
router.get '/', (req, res) ->
	callback = (rows) ->
		res.json
			success: true
			data: rows
	transaction.fetch callback

# ADD transaction into database
router.post '/', (req, res) ->
	callback = (rows) ->
		res.json
			success: true
			message: 'Add successfull'
	# trans = 
	# 	userId: 1
	# 	name: 'Lorem Ipsum'
	# 	amount: 100
	# 	tag: 'lr, new'
	# 	date: new Date()
	# 	type: 'income'
	transaction.add req.body, callback

module.exports = router
