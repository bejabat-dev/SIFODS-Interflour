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
    const { email } = req.body;
    const query = 'SELECT * FROM users WHERE email = ?';
    db.query(query, [email], (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'Database query failed' });
        }
        res.status(201).json(result[0]);
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

        bcrypt.hash(password, saltRounds, (err, hashedPassword) => {
            if (err) {
                return res.status(500).json({ error: 'Password hashing failed' });
            }

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

router.post('/add_truck', (req,res) => {
    const { id_user, nopol, nama, ekspedisi, supir, jenis, telp, volume, jumlah } = req.body;
    const query = 'INSERT INTO vehicles (id_user,nopol,nama,ekspedisi,supir,jenis,telp,volume,jumlah) VALUES(?,?,?,?,?,?,?,?,?)';
    db.query(query,[id_user,nopol, nama, ekspedisi, supir, jenis, telp, volume, jumlah],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json({message:'Success'});
    });
});

router.post('/add_container', (req,res) => {
    const { id_user,nomor,nama,seal } = req.body;
    const query = 'INSERT INTO container (id_user,nomor,nama,seal) VALUES(?,?,?,?)';
    db.query(query,[id_user,nomor,nama,seal],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json({message:'Success'});
    });
});

router.post('/add_product', (req,res) => {
    const { id_user,kode,nama } = req.body;
    const query = 'INSERT INTO container (id_user,kode,nama) VALUES(?,?,?)';
    db.query(query,[id_user,kode,nama],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json({message:'Success'});
    });
});

router.get('/nopol', (req,res) => {
    const { id_user } = req.body;
    const query = 'SELECT nopol FROM vehicles WHERE id_user = ?';
    db.query(query,[id_user],(err,results)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json(results);
    });
});

router.post('/log', (req,res) => {
    const { id_user,type,value } = req.body;
    const query = 'INSERT INTO log (id_user,type,value) VALUES(?,?,?)';
    db.query(query,[id_user,type,value],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json({message:'Success'});
    });
});

router.get('/logs', (req,res) => {
    const { id_user } = req.body;
    const query = 'SELECT * FROM log WHERE id_user = ?';
    db.query(query,[id_user],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json(result);
    });
});

router.post('/checklist/truck', (req,res) => {
    const { id_user,nopol,box0,box1,box2,box3,box4,box5,box6,box7,box8 } = req.body;
    const query = 'INSERT INTO checklist_truck (id_user,nopol,box0,box1,box2,box3,box4,box5,box6,box7,box8) VALUES(?,?,?,?,?,?,?,?,?,?,?)';
    db.query(query,[id_user,nopol,box0,box1,box2,box3,box4,box5,box6,box7,box8],(err,result)=>{
        if(err){
            return res.status(500).json({ error: 'Error' });
        }
        res.status(201).json({message:'Success'});
    });
});

app.use('/api', router);

const port = process.env.PORT || 3000;
app.listen(port, '0.0.0.0', () => {
    console.log(`Server is running on port ${port}`);
});
