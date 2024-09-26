const express = require("express");
const db = require("../db");
const router = express.Router();

router.get("/nopol", (req, res) => {
  const { id_user } = req.body;
  const query =
    "SELECT nopol FROM vehicles WHERE id_user = ? AND status = 'new'";
  db.query(query, [id_user], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(results);
  });
});

router.get("/detail/truck", (req, res) => {
  const { id } = req.body;
  const query = "SELECT * FROM vehicles WHERE id = ?";
  db.query(query, [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(results[0]);
  });
});

router.get("/detail/container", (req, res) => {
  const { id } = req.body;
  const query = "SELECT * FROM container WHERE id = ?";
  db.query(query, [id], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(results[0]);
  });
});

router.get("/container", (req, res) => {
  const { id_user } = req.body;
  const query = "SELECT nomor FROM container WHERE id_user = ?";
  db.query(query, [id_user], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(results);
  });
});
router.get("/update_container", (req, res) => {
  const { id_user } = req.body;
  const query =
    "SELECT nomor FROM checklist_container WHERE id_user = ? AND status = 'new'";
  db.query(query, [id_user], (err, results) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(results);
  });
});

router.post("/add_truck", (req, res) => {
  const {
    id_user,
    nopol,
    nama,
    ekspedisi,
    supir,
    jenis,
    telp,
    volume,
    jumlah,
  } = req.body;
  const query =
    "INSERT INTO vehicles (id_user,nopol,nama,ekspedisi,supir,jenis,telp,volume,jumlah) VALUES(?,?,?,?,?,?,?,?,?)";
  db.query(
    query,
    [id_user, nopol, nama, ekspedisi, supir, jenis, telp, volume, jumlah],
    (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error" });
      }
      res.status(201).json(result.insertId);
    }
  );
});

router.post("/add_container", (req, res) => {
  const { id_user, nomor, nama, seal } = req.body;
  const query =
    "INSERT INTO container (id_user,nomor,nama,seal) VALUES(?,?,?,?)";
  db.query(query, [id_user, nomor, nama, seal], (err, result) => {
    if (err) {
      console.error(err);
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json(result.insertId);
  });
});

router.post("/add_product", (req, res) => {
  const { id_user, kode, nama } = req.body;
  const query = "INSERT INTO container (id_user,kode,nama) VALUES(?,?,?)";
  db.query(query, [id_user, kode, nama], (err, result) => {
    if (err) {
      return res.status(500).json({ error: "Error" });
    }
    res.status(201).json({ message: "Success" });
  });
});

module.exports = router;
