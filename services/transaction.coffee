db = require './db'
DateFilter = require './date-filter'

table = 'transaction'

transaction = 
	fetch: (query, cb) ->
		callback = (rows) ->
			cb rows
		type = "`type`='#{query.type}'"
		type = "1" if not query.type?
		term = "`name` LIKE '%#{query.term}%'"
		term = "1" if not query.term?	
		conditional = "#{type} and #{term} and #{DateFilter.build(query.date, 'date')}"
		item = "id, name, amount, tag, type, date"
		sql = "SELECT #{item} FROM `#{table}` WHERE #{conditional} ORDER BY `date` DESC"
		db.query sql, callback
	add: (t, cb) ->
		callback = (rows) ->
			cb rows
		field = '(`user_id`, `name`, `amount`, `tag`, `type`, `date`)'
		value = "('#{t.userId}','#{t.name}','#{t.amount}','#{t.tag}','#{t.type}','#{t.date.toISOString()}')"
		sql = "INSERT INTO `#{table}` #{field} VALUES #{value}"
		db.query sql, callback
	edit: (t, cb) ->
		callback = (rows) ->
			cb()
		set = "`name`='#{t.name}',`amount`='#{t.amount}',`tag`='#{t.tag}',`date`='#{t.date.toISOString()}',`type`='#{t.type}'"
		conditional = "`id` = #{t.id}"
		sql = "UPDATE `#{table}` SET #{set} WHERE #{conditional}"
		db.query sql, callback
	delete: (t, cb) ->
		callback = (rows) ->
			cb()
		conditional = "`id` = #{t.id}"
		sql = "DELETE FROM `#{table}` WHERE #{conditional}"
		db.query sql, callback

module.exports = transaction