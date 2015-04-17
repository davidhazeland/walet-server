transaction = require '../services/transaction'

handler = 
	handle: (data, callback) ->
		cb = (transaction) ->
			# Calculate total amount
			total = 0
			total += t.amount for t in transaction

			# Limit item return
			start = parseInt data.start
			end = parseInt data.end
			start = 0 if not start?
			end = transaction.length if not end?

			# Return
			callback 
				items: transaction[start..end]
				overview:
					total: total
					type: data.type

		# Query
		query =
			type: data.type
			term: data.term
			date: data.date

		transaction.fetch query, cb

module.exports = handler