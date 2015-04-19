dashboard = require '../services/dashboard'

handler = 
	handle: (data, cb) ->
		callback = (data) ->
			result = 
				income: {}
				expense: {}
				overview: {
					income: 0
					expense: 0
				}
			for item in data
				item.tag = 'Untagged' if item.tag is ''
				tags = item.tag.split ','
				type = item.type
				for t in tags
					result[type][t] = 0 if not result[type][t]?
					result[type][t] += item.amount
					result.overview[type] += item.amount
			result.overview.networth = result.overview.income - result.overview.expense
			cb result
		dashboard.fetchTag data, callback

module.exports = handler