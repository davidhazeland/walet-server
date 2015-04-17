DateFilter = 
	build: (date, field) ->
		switch date
			when "thisweek" then result = "YEARWEEK(`#{field}`)=YEARWEEK(NOW())"
			when "thismonth" then result = "YEAR(`#{field}`) = YEAR(NOW()) AND MONTH(`#{field}`) = MONTH(NOW())"
			when "lastmonth" then result = "YEAR(`#{field}`) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) 
				AND MONTH(`#{field}`) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)"
			when "thisyear" then result = "YEAR(`#{field}`) = YEAR(CURDATE())"
			when "lastyear" then result = "YEAR(`#{field}`) = YEAR(DATE_SUB(CURDATE(), INTERVAL 1 YEAR))"
			else result = "1"
		result

module.exports = DateFilter