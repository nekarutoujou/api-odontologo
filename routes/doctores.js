/*
    Rutas de doctores
    host + /api/doctores
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL DOCTORS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM doctor', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando doctores');
    } else {
      console.log(err);
    }
  });  
});

// GET ONE DOCTOR
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM doctor WHERE d_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando doctor '+id);
          } else {
            console.log(err);
          }
    });
});

// DELETE A DOCTOR
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('DELETE FROM doctor WHERE d_id = ?', [id], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Doctor eliminado'});
        console.log('Doctor '+id+' eliminado');
      } else {
        console.log(err);
      }
    });
  });


module.exports = router;