const express = require("express");
const db = require("../db");
const router = express.Router();

router.get("/nopol", (req, res) => {
    const { id_user } = req.body;
    const query = "SELECT nopol FROM vehicles WHERE id_user = ?";
    db.query(query, [id_user], (err, results) => {
      if (err) {
        return res.status(500).json({ error: "Error" });
      }
      res.status(201).json(results);
    });
  });

  module.exports = router;