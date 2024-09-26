const express = require("express");
const db = require("../db");
const router = express.Router();

router.get("/checklist/container", (req, res) => {
  const { id } = req.body;
  const query = "SELECT * FROM checklist_container WHERE id = ?";
  db.query(query, [id], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json("Database failed");
    }
    res.status(201).json(result);
  });
});

router.get("/checklist/vehicle", (req, res) => {
    const { id } = req.body;
    const query = "SELECT * FROM checklist_truck WHERE id = ?";
    db.query(query, [id], (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json("Database failed");
      }
      res.status(201).json(result);
    });
  });

module.exports = router;