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

app.listen(process.env.PORT || 3000, () => {
  console.log("server started on port 3000");
});

// Here are all the Creates
app.post("/player", (req, res) => {
  connection.query(
    `INSERT INTO player(Pace, Dribbling, Physical, Passing, Shooting, Defending, Pname, Image, CID, CountryName)
      VALUES (${req.body.pace},${req.body.dribbling},${req.body.physical},${req.body.passing},${req.body.shooting},${req.body.defending},'${req.body.pname}','${req.body.image}','${req.body.cid}','${req.body.countryname}');`,
    function (error, results, fields) {
      if (error) throw error;
      console.log("inserted");
    }
  );
});
app.post("/club", (req, res) => {
  connection.query(
    `INSERT INTO club(ClubName, EstablishDate, Street, ZIP, City)
      VALUES ('${req.body.club}','${req.body.date}','${req.body.street}','${req.body.zip}','${req.body.city}');`,
    function (error, results, fields) {
      if (error) throw error;
      res.send("inserted");
    }
  );
});

app.post("/country", (req, res) => {
  connection.query(
    `INSERT INTO country(CountryName, Continent)
      VALUES ('${req.body.country}','${req.body.continent}');`,
    function (error, results, fields) {
      if (error) throw error;
      res.send("inserted");
    }
  );
});

app.post("/league", (req, res) => {
  connection.query(
    `INSERT INTO league(LeagueName, Category, CountryName)
      VALUES ('${req.body.league}','${req.body.category}','${req.body.country}');`,
    function (error, results, fields) {
      if (error) throw error;
      res.send("insereted");
    }
  );
});

app.post("/manager", (req, res) => {
  connection.query(
    `INSERT INTO manager(ManagerName, CID)
      VALUES ('${req.body.manager}','${req.body.cid}');`,
    function (error, results, fields) {
      if (error) throw error;
      res.send("insereted");
    }
  );
});

// Here are all the gets
app.get("/players", (req, res) => {
  connection.query(`SELECT * from player`, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});
app.get("/clubs", (req, res) => {
  connection.query(`SELECT * from club`, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});
app.get("/leagues", (req, res) => {
  connection.query(`SELECT * from league`, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});
app.get("/managers", (req, res) => {
  connection.query(`SELECT * from manager`, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});
app.get("/countries", (req, res) => {
  connection.query(`SELECT * from country`, function (error, results, fields) {
    if (error) throw error;
    res.send(results);
  });
});

// Complex Queries
