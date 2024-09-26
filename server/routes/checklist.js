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

router.post("/checklist/container", (req, res) => {
  const {
    id_user,
    nomor,
    box0,
    box1,
    box2,
    box3,
    box4,
    box5,
    box6,
    box7,
    box8,
    eks0,
    eks1,
    eks2,
    eks3,
    eks4,
    eks5,
    eks6,
    catatan,
  } = req.body;
  const query =
    "INSERT INTO checklist_container (id_user,nomor,box0,box1,box2,box3,box4,box5,box6,box7,box8,eks0,eks1,eks2,eks3,eks4,eks5,eks6,catatan) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

  db.query(
    query,
    [
      id_user,
      nomor,
      box0,
      box1,
      box2,
      box3,
      box4,
      box5,
      box6,
      box7,
      box8,
      eks0,
      eks1,
      eks2,
      eks3,
      eks4,
      eks5,
      eks6,
      catatan,
    ],
    (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: err });
      }
      res.status(201).json(result.insertId);
    }
  );
});

router.post("/checklist/truck", (req, res) => {
  const {
    id_user,
    nopol,
    box0,
    box1,
    box2,
    box3,
    box4,
    box5,
    box6,
    box7,
    box8,
  } = req.body;
  const query =
    "INSERT INTO checklist_truck (id_user,nopol,box0,box1,box2,box3,box4,box5,box6,box7,box8) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
  db.query(
    query,
    [id_user, nopol, box0, box1, box2, box3, box4, box5, box6, box7, box8],
    (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error" });
      }
      res.status(201).json(result.insertId);
    }
  );
});

router.post("/checklist/update", (req, res) => {
  const { id_user, nomor, box0, box1, box2, box3, box4, box5, box6, box7 } =
    req.body;
  const query =
    "INSERT INTO update_container (id_user,nomor,box0,box1,box2,box3,box4,box5,box6,box7) VALUES(?,?,?,?,?,?,?,?,?,?)";
  db.query(
    query,
    [id_user, nomor, box0, box1, box2, box3, box4, box5, box6, box7],
    (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error" });
      }
      res.status(201).json(result.insertId);
    }
  );
});

module.exports = router;
