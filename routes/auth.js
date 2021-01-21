/*
    Rutas de autentificación doctores/admin
    host + /api/auth
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL USERS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM auth', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando usuarios');
    } else {
      console.log(err);
    }
  });  
});


// GET ONE USER
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM auth WHERE auth_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando usuario '+id);
          } else {
            console.log(err);
          }
    });
});

module.exports = router;