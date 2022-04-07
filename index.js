const express = require("express");
const app = express();
app.use(express.json());
const mysql = require("mysql");
const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Levw1234",
  database: "fifa",
});

connection.connect();

connection.query("SELECT 1 + 1 AS solution", function (error, results, fields) {
  if (error) throw error;
  console.log("The solution is: ", results[0].solution);
});

app.listen(process.env.PORT || 3000, () => {
  console.log("server started on port 3000");
});

app.post("/player", (req, res) => {
  connection.query(
    `INSERT INTO player
      VALUES ();`,
    function (error, results, fields) {
      if (error) throw error;
      console.log("The solution is: ", results[0].solution);
    }
  );
});
app.post("/club", (req, res) => {
  // create club
});
app.post("/league", (req, res) => {
  // create league
});
app.get("players", (req, res) => {
  // get players
});
app.get("clubs", (req, res) => {
  // get clubs
});
app.get("leagues", (req, res) => {
  // get leagues
});

connection.end();
