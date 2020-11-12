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
	host: process.env.DB_HOST,
	user: process.env.DB_USER, 
	password: process.env.DB_PASSWORD, 
	database: process.env.DB_DATABASE 
});

var host = process.env.DB_HOST;
var user = process.env.DB_USER;
var password = process.env.DB_PASSWORD;
var database = process.env.DB_DATABASE;
console.log (host + " " + user + " " +  password + " " + database);


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
