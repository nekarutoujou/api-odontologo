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
    pool.query('SELECT * FROM odontograma WHERE o_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando odontograma '+id);
          } else {
            console.log(err);
          }
    });
});


// INSERT AN ODONTOGRAM
router.post('/', async (req, res) => {
  const { o_id, o_hc, o_datecapture, o_teethcollection, o_remark} = req.body;
  const newOd = {
    o_id,
    o_hc,
    o_datecapture,
    o_teethcollection,
    o_remark
  };
  await pool.query('INSERT INTO odontograma set ?', [newOd], (err, rows, fields) => {
    if (!err) {
      res.send(newOd);
      console.log('Odontograma guardado')
    } else {
      console.log(err);
    }

  });
});

// MODIFY AN APPOINTMENT
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { o_hc, o_datecapture, o_teethcollection, o_remark } = req.body;
  const newOd = {
    o_hc,
    o_datecapture,
    o_teethcollection,
    o_remark
  };
  await pool.query('UPDATE odontograma SET ? WHERE o_id =?', [newOd, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Odontograma '+id+' modificado'});
      console.log('Odontograma '+id+' modificado');
    } else {
      console.log(err);
    }
    });
  });


// DELETE AN ODONTOGRAM
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM odontograma WHERE o_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Odontograma eliminado'});
      console.log('Odontograma eliminado');
    } else {
      console.log(err);
    }
  });
});

module.exports = router;