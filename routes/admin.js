/*
    Rutas de admin
    host + /api/admin
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL ADMINS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM adm', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando admins');
    } else {
      console.log(err);
    }
  });  
});


// GET ONE ADMIN
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM adm WHERE a_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando admin '+id);
          } else {
            console.log(err);
          }
    });
});

module.exports = router;