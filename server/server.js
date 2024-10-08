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

router.use(vehicles);
router.use(logs);
router.use(auth);
router.use(checklist);

app.use("/sifods", router);

const port = process.env.PORT || 3000;
app.listen(port, "0.0.0.0", () => {
  console.log(`Server is running on port ${port}`);
});
