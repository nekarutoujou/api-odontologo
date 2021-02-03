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
      res.status(200);
      res.json(rows);
      console.log('Mostrando admins');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE ADMIN
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from adm WHERE a_id= ${id} `; 
  pool.query('SELECT * FROM adm WHERE a_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando admin '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe admin');
        console.log(err);  
      }
    });
  });
});

module.exports = router;