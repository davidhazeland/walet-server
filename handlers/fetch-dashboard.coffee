TagDashboard = require './fetch-tag-dashboard'
CompareDashboard = require './fetch-compare-dashboard'

handler = 
	handle: (data, cb) ->
		TagDashboard.handle data, (tagResult) ->
			CompareDashboard.handle data, (compareResult) ->
				result =
					tag: tagResult
					compare: compareResult
				cb(result)

module.exports = handler