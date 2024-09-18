const express = require("express");
const db = require("../db");
const saltRounds = 10;
const bcrypt = require("bcrypt");
const router = express.Router();

router.get("/user", (req, res) => {
    const { email } = req.body;
    const query = "SELECT * FROM users WHERE email = ?";
    db.query(query, [email], (error, result) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ error: "Database query failed" });
      }
  
      res.status(201).json(result[0]);
    });
  });
  
  router.post("/register", (req, res) => {
    const { nama, email, password, jabatan, nomor_hp, photo } = req.body;
    const query =
      "INSERT INTO users (nama, email, password, jabatan, nomor_hp, photo) VALUES (?, ?, ?, ?, ?, ?)";
    const checkEmail = "SELECT email FROM users WHERE email = ?";
  
    db.query(checkEmail, [email], (error, result) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ error: "Database query failed" });
      }
      if (result.length > 0) {
        return res.status(400).json({ message: "Email sudah digunakan" });
      }
  
      bcrypt.hash(password, saltRounds, (err, hashedPassword) => {
        if (err) {
          console.error(error);
          return res.status(500).json({ error: "Password hashing failed" });
        }
  
        db.query(
          query,
          [nama, email, hashedPassword, jabatan, nomor_hp, photo],
          (error, result) => {
            if (error) {
              console.error(error);
              return res.status(500).json({ error: "Failed to register user" });
            }
            const nextResult = "SELECT * FROM users WHERE email = ?";
            db.query(nextResult, [email], (err2, res2) => {
              if (err2) {
                console.error(err2);
                return res.status(500).json("Error fetching data");
              }
              res.status(201).json(res2[0]);
            });
          }
        );
      });
    });
  });
  
  router.get("/login", (req, res) => {
    const { email, password } = req.body;
    const checkEmail = "SELECT * FROM users WHERE email = ?";
  
    db.query(checkEmail, [email], (error, result) => {
      if (error) {
        console.error(error);
        return res.status(500).json({ error: "Database query failed" });
      }
      if (result.length === 0) {
        return res.status(400).json({ message: "Email tidak ditemukan" });
      }
  
      const user = result[0];
  
      bcrypt.compare(password, user.password, (err, match) => {
        if (err) {
          return res.status(500).json({ error: "Password comparison failed" });
        }
        if (!match) {
          return res.status(401).json({ message: "Kata sandi salah" });
        }
  
        res.status(201).json(user);
      });
    });
  });

module.exports = router;