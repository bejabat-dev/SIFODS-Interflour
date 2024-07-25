const express = require('express');
const dotenv = require('dotenv');
const db = require('./db');
const bcrypt = require('bcrypt');
const saltRounds = 10;

dotenv.config();

const app = express();
const router = express.Router();

app.use(express.json());

router.get('/user', (req, res) => {
    const {email} = req.body;
    const query = 'SELECT * FROM users WHERE email = ?';
    db.query(query,[email], (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'Database query failed' });
        }
        res.status(201).json(result[0]);
    });
});


// Registration route
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

        // Hash the password
        bcrypt.hash(password, saltRounds, (err, hashedPassword) => {
            if (err) {
                return res.status(500).json({ error: 'Password hashing failed' });
            }

            // Insert the new user with hashed password
            db.query(query, [nama, email, hashedPassword, jabatan], (error, result) => {
                if (error) {
                    return res.status(500).json({ error: 'Failed to register user' });
                }
                res.status(201).json({ message: 'User registered successfully' });
            });
        });
    });
});

// Login route
router.get('/login', (req, res) => {
    const { email, password } = req.body;
    const checkEmail = 'SELECT * FROM users WHERE email = ?';

    db.query(checkEmail, [email], (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'Database query failed' });
        }
        if (result.length === 0) {
            return res.status(400).json({ message: 'Email tidak ditemukan' });
        }

        const user = result[0];

        // Compare the provided password with the hashed password
        bcrypt.compare(password, user.password, (err, match) => {
            if (err) {
                return res.status(500).json({ error: 'Password comparison failed' });
            }
            if (!match) {
                return res.status(401).json({ message: 'Kata sandi salah' });
            }

            // Successful login
            res.status(201).json({ message: 'Login successful' });
        });
    });
});


app.use('/api', router);

const port = process.env.PORT || 3000;
app.listen(port,'0.0.0.0', () => {
    console.log(`Server is running on port ${port}`);
});
