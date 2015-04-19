dashboard = require '../services/dashboard'

monthNames = [
	'January'
	'February'
	'March'
	'April'
	'May'
	'June'
  	'July'
  	'August'
  	'September'
  	'October'
  	'November'
  	'December'
]

monthNamesShort = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

handler = 
	handle: (data, cb) ->
		callback = (data) ->
			result = {}
			for item in data
				name = item.date
				result[name] = {} if not result[name]?
				result[name][item.type] = item.total
			cb result
		dashboard.fetchCompare data, callback

module.exports = handler