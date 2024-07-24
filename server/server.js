const express = require('express');
const dotenv = require('dotenv');
const db = require('./db');

dotenv.config();

const app = express();
const router = express.Router();

app.use(express.json());

router.get('/user', (req, res) => {
    const query = 'SELECT * FROM users';
    db.query(query, (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'Database query failed' });
        }
        res.status(200).json(result);
    });
});

router.post('/register', (req, res) => {
    const { nama, email, password, jabatan } = req.body;
    const query = 'INSERT INTO users (nama, email, password, jabatan) VALUES (?, ?, ?, ?)';
    const checkEmail = 'SELECT email FROM users WHERE email = ?';

    db.query(checkEmail, [email], (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'Database query failed' });
        }
        if (result.length > 0) {
            return res.status(400).json({ message: 'Email sudah digunakan' });
        }

        db.query(query, [nama, email, password, jabatan], (error, result) => {
            if (error) {
                return res.status(500).json({ error: 'Failed to register user' });
            }
            res.status(201).json({ message: 'User registered successfully' });
        });
    });
});

app.use('/api', router);

const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});
