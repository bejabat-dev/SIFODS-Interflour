const express = require("express");
const db = require("../db");
const router = express.Router();

router.get("/logs", (req, res) => {
  const { id_user } = req.body;
  const query = "SELECT * FROM logs WHERE id_user = ?";
  db.query(query, [id_user], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ message: "Database failed" });
    }
    res.status(201).json(result);
  });
});

router.post("/logs", (req, res) => {
  const { id_user, type, type_id, tanggal, value } = req.body;
  const query =
    "INSERT INTO vehicles (id_user,type,type_id,tanggal,value) VALUES (?,?,?,?,?)";
  db.query(query, [id_user, type, type_id, tanggal, value], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json("Database error");
    }
    res.status(201).json(result);
  });
});

module.exports = router;
