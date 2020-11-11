/**
 * @author Nasrin Kabir <nasrink@cybage.com> 
 */

const mysql = require('mysql');
var http = require('http');

// environment variables
const PORT = process.env.PORT || 4000;
const HOST = process.env.HOST || '0.0.0.0';


// mysql credentials
const connection = mysql.createConnection({
	host: process.env.MYSQL_HOST,
	user: process.env.MYSQL_USER, 
	password: process.env.MYSQL_PASSWORD, 
	database: process.env.MYSQL_DATABASE 
});


connection.connect(function(err) {
      if (err) {
        console.log("Couldn't connect to the required MySQL DB.");
        throw err;
      }
    });


// fetch Hello World string from database 

var queryString="select * from helloworld;";
var result='';

connection.query(queryString, (error, rows, fields) => {
  if (error) {
    return console.error(error.message);
  }
  result = rows[0].text;
  console.log('resulti from db : ' + result);
});


http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write('Hello World!\n');
  res.end();
}).listen(4000);

