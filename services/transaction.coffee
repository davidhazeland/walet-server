db = require './db'

table = 'transaction'

transaction = 
	fetch: (query, cb) ->
		conditional = "`type`='#{query.type}' and `name` LIKE '%#{query.term}%' and #{getDateConditional(query.date)}"
		item = "id, name, amount, tag, date"
		sql = "SELECT #{item} FROM `#{table}` WHERE #{conditional}"
		db.query sql, cb
	add: (t, cb) ->
		callback = (rows) ->
			cb()
		field = '(`user_id`, `name`, `amount`, `tag`, `type`, `date`)'
		value = "('#{t.userId}','#{t.name}','#{t.amount}','#{t.tag}','#{t.type}','#{t.date.toISOString()}')"
		sql = "INSERT INTO `#{table}` #{field} VALUES #{value}"
		db.query sql, callback

getDateConditional = (date) ->
	field = '`date`'
	switch date
		when "thisweek" then result = "YEARWEEK(#{field})=YEARWEEK(NOW())"
		when "thismonth" then result = "YEAR(#{field}) = YEAR(NOW()) AND MONTH(#{field}) = MONTH(NOW())"
		when "lastmonth" then result = "YEAR(#{field}) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND MONTH(#{field}) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)"
		when "thisyear" then result = "YEAR(#{field}) = YEAR(CURDATE())"
		when "lastyear" then result = "YEAR(#{field}) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))"
		else result = "1"
	result

module.exports = transaction