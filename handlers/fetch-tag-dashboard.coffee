dashboard = require '../services/dashboard'

handler = 
	handle: (data, cb) ->
		callback = (data) ->
			result = {}
			for item in data
				item.tag = 'untag' if item.tag is ''
				tags = item.tag.split ','
				for t in tags
					result[t] = 0 if not result[t]?
					result[t] += item.amount
			cb result
		dashboard.fetchTag data, callback

module.exports = handler