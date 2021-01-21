/*
    Rutas de solicitudes
    host + /api/solicitudes
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL REQUESTS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM solicitud', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando solicitudes');
    } else {
      console.log(err);
    }
  });  
});

// GET ONE REQUEST
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM solicitud WHERE s_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando solicitud '+id);
          } else {
            console.log(err);
          }
    });
});

module.exports = router;