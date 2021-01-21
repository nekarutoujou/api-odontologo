/*
    Rutas de tipos de tratamiento
    host + /api/tipos
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL TYPES
router.get('/', (req, res) => {
  pool.query('SELECT * FROM tipo_tratamiento', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando tipos de tratamiento');
    } else {
      console.log(err);
    }
  });  
});

// GET ONE TYPE
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM tipo_tratamiento WHERE t_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando tratamiento tipo '+id);
          } else {
            console.log(err);
          }
    });
});

module.exports = router;