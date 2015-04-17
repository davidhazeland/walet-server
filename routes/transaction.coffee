express = require 'express'
router = express.Router()
AddTransactionHandler = require '../handlers/add-transaction'
FetchTransactionHandler = require '../handlers/fetch-transaction'
EditTransactionHandler = require '../handlers/edit-transaction'
DeleteTransactionHandler = require '../handlers/delete-transaction'
FetchCompareDashboardHandler = require '../handlers/fetch-compare-dashboard'
FetchTagDashboardHandler = require '../handlers/fetch-tag-dashboard'

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

router.put '/', (req, res) ->
	callback = (message) ->
		res.json
			success: true
			message: message
	data = req.body
	EditTransactionHandler.handle data, callback

router.delete '/', (req, res) ->
	callback = (message) ->
		res.json
			success: true
			message: message
	data = req.body
	DeleteTransactionHandler.handle data, callback

router.get '/dashboard/compare', (req, res) ->
	callback = (transactions) ->
		res.json
			success: true
			data: transactions
	query = req.query
	FetchCompareDashboardHandler.handle query, callback

router.get '/dashboard/tag', (req, res) ->
	callback = (transactions) ->
		res.json
			success: true
			data: transactions
	query = req.query
	FetchTagDashboardHandler.handle query, callback

module.exports = router
