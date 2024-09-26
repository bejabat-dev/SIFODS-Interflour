const express = require("express");
const dotenv = require("dotenv");
const db = require("./db");
const vehicles = require("./routes/vehicles");
const auth = require("./routes/auth");
const logs = require("./routes/logs");
const checklist = require("./routes/checklist");
dotenv.config();

const app = express();
const router = express.Router();

app.use(express.json());

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

router.post("/update/container", (req, res) => {
  const { id_user, nopol, box0, box1, box2, box3, box4, box5, box6, box7 } =
    req.body;
  const query =
    "INSERT INTO update_container (id_user,nopol,box0,box1,box2,box3,box4,box5,box6,box7) VALUES(?,?,?,?,?,?,?,?,?,?)";
  db.query(
    query,
    [id_user, nopol, box0, box1, box2, box3, box4, box5, box6, box7],
    (err, result) => {
      if (err) {
        console.error(err);
        return res.status(500).json({ error: "Error" });
      }
      res.status(201).json({ message: "Success" });
    }
  );
});

router.use(vehicles);
router.use(logs);
router.use(auth);
router.use(checklist);

app.use("/sifods", router);

const port = process.env.PORT || 3000;
app.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on port ${port}`);
});
