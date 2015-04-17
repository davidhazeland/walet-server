db = require './db'

transaction = 
	fetch: (callback) ->
		sql = 'SELECT * FROM `transaction` WHERE 1'
		db.query sql, callback
	add: (trans, callback) ->
		if not trans.date
			trans.date = new Date()
		field = '(`user_id`, `name`, `amount`, `tag`, `type`, `date`)'
		value = "('#{trans.userId}','#{trans.name}','#{trans.amount}','#{trans.tag}','#{trans.type}','#{trans.date.toISOString()}')"
		sql = "INSERT INTO `transaction` #{field} VALUES #{value}"
		db.query sql, callback

module.exports = transaction