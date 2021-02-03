/*
    Rutas de tipos de tratamiento
    host + /api/tipos
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET A RESUME LIST WITH ALL TYPES
router.get('/', (req, res) => {
  pool.query('SELECT t_id, t_name FROM tipo_tratamiento', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando resumen de tipos de tratamiento');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ALL TYPES
router.get('/all', (req, res) => {
  pool.query('SELECT * FROM tipo_tratamiento', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando tipos de tratamiento');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE TYPE
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from tipo_tratamiento WHERE t_id= ${id} `; 
  pool.query('SELECT * FROM tipo_tratamiento WHERE t_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando tratamiento tipo '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe tratamiento tipo');
        console.log(err);  
      }
    });
  });
});


module.exports = router;