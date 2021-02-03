/*
    Rutas de odontogramas
    host + /api/odontogramas
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL ODONTOGRAMS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM odontograma', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando odontogramas');
    } else {
      console.log(err);
    }
  });  
});


// GET ONE ODONTOGRAM
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from odontograma WHERE o_id= ${id} `; 
  pool.query('SELECT * FROM odontograma WHERE o_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando odontograma '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe odontograma');
        console.log(err);  
      }
    });
  });
});


// INSERT AN ODONTOGRAM
router.post('/', async (req, res) => {
  const { o_hc, o_datecapture, o_teethcollection, o_remark} = req.body;
  const newOd = {
    o_hc,
    o_datecapture,
    o_teethcollection,
    o_remark
  };
await pool.query('INSERT INTO odontograma set ?', [newOd], (err, rows, fields) => {
  if (!err) {
    res.status(200);
    res.send(newOd);
    console.log('Odontograma guardado')
  } else {
    res.status(400);
    console.log(err);
  }
});
});


// MODIFY AN ODONTOGRAM
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  let sql = `Select * from odontograma WHERE o_id= ${id} `; 
  const { o_hc, o_datecapture, o_teethcollection, o_remark } = req.body;
  const newOd = {
    o_hc,
    o_datecapture,
    o_teethcollection,
    o_remark
  };
  await pool.query('UPDATE odontograma SET ? WHERE o_id =?', [newOd, id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json({status: 'Odontograma '+id+' modificado'});
        console.log('Odontograma '+id+' modificado');         
      }else {
        res.status(400);
        res.send('Error, no existe odontograma');
        console.log(err);  
      }
  });
  });
});


// DELETE AN ODONTOGRAM
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM odontograma WHERE o_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Odontograma eliminado'});
      console.log('Odontograma eliminado');
    } else {
      res.status(400);
      console.log(err);
    }
  });
});


module.exports = router;