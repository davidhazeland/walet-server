db = require './db'
DateFilter = require './date-filter'

table = 'transaction'

dashboard = 
	fetchCompare: (query, cb) ->
		callback = (rows) ->
			cb rows
		item = "type, sum(amount) as total, MONTH(`date`) as date"
		group = "`type`, MONTH(`date`)"
		sort = "`date` ASC"
		sql = "SELECT #{item} FROM `#{table}` GROUP BY #{group} ORDER BY #{sort}"
		db.query sql, callback
	fetchTag: (query, cb) ->
		callback = (rows) ->
			cb rows
		item = "amount, tag"
		conditional = "`type`='#{query.type}' and #{DateFilter.build query.date, 'date'}"
		sql = "SELECT #{item} FROM `#{table}` WHERE #{conditional}"
		db.query sql, callback

module.exports = dashboard