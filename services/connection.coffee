mysql = require 'mysql'

connection = mysql.createConnection
	host		: 'localhost'
	user		: 'root'
	password	: ''
	database	: 'walet'

module.exports = connection