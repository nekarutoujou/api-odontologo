/*
    Rutas de autentificación doctores/admin
    host + /api/auth
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// SIGN IN
router.post('/signin', (req, res) => {
  const auth_user = req.body.auth_user;
  const auth_password = req.body.auth_password;
  pool.query('SELECT * FROM auth WHERE auth_user = ? AND auth_password =?', [auth_user, auth_password], (err, rows, fields) => {
    if (rows.length === 1)
        {
          res.status(200);
          console.log(rows);
          res.send(rows);
        }
    else
        {
          console.log(err);
          res.status(401);
          res.send('Usuario/contraseña no coincide');
        }      
  });
});


// DATA FOR SIGN UP
router.get('/signup/data/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from doctor WHERE d_id= ${id}`; 
  pool.query('SELECT d_img, d_name, d_lastname FROM doctor WHERE d_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe doctor');
        console.log(err);  
      }
    });
  });
});


// GET ALL USERS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM auth', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando usuarios');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE USER
router.get('/:id', (req, res) => {
    const { id } = req.params;
    let sql = `Select * from auth WHERE auth_id= ${id} `; 
    pool.query('SELECT * FROM auth WHERE auth_id = ?', [id], (err, rows, fields) => {
      pool.query(sql, function (err, result) {
        if (err) throw err;  
        if (result.length){
          res.status(200);
          res.json(rows);
          console.log('Mostrando usuario '+id);         
        }else {
          res.status(400);
          res.send('Error, no existe usuario');
          console.log(err);  
        }
    });
  });
});


// GET ALL DOCTORS
router.get('/doctor', (req, res) => {
  pool.query('SELECT * FROM auth WHERE auth_type = "doctor"', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando doctores');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE DOCTOR
router.get('/doctor/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from auth WHERE auth_id= ${id}  && auth_type = "doctor"`; 
  pool.query('SELECT * FROM auth WHERE auth_id = ? && auth_type = "doctor"', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe doctor');
        console.log(err);  
      }
    });
  });
});

module.exports = router;