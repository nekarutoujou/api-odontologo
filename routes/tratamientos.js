/*
    Rutas de tratamiento_paciente
    host + /api/tratamientos
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL TREATMENTS (PATIENT)
router.get('/', (req, res) => {
  pool.query('SELECT * FROM tratamiento_paciente', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando tratamientos de pacientes');
    } else {
      console.log(err);
    }
  });  
});


// GET ONE TREATMENT (PATIENT)
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM tratamiento_paciente WHERE tp_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando tratamiento de paciente '+id);
          } else {
            console.log(err);
          }
    });
});


// INSERT A TREATMENT (PATIENT)
router.post('/', async (req, res) => {
  const { tp_id, tp_tid, tp_did, tp_description, tp_start, tp_end, tp_ndates } = req.body;
  const newTp = {
    tp_id,
    tp_tid,
    tp_did,
    tp_description,
    tp_start,
    tp_end,
    tp_ndates
  };
  await pool.query('INSERT INTO tratamiento_paciente set ?', [newTp], (err, rows, fields) => {
    if (!err) {
      res.send(newTp);
      console.log('Tratamiento (paciente) guardado')
    } else {
      console.log(err);
    }
  });
});


// MODIFY A TREATMENTS (PATIENT)
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { tp_tid, tp_did, tp_description, tp_start, tp_end, tp_ndates } = req.body;
  const newTp = {
    tp_tid,
    tp_did,
    tp_description,
    tp_start,
    tp_end,
    tp_ndates
  };
  await pool.query('UPDATE tratamiento_paciente SET ? WHERE tp_id =?', [newTp, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Tratamiento de paciente '+id+' modificado'});
      console.log('Tratamiento de paciente '+id+' modificado');
    } else {
      console.log(err);
    }
    });
});


// DELETE A TREATMENT (PATIENT)
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM tratamiento_paciente WHERE tp_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Tratamiento eliminado'});
      console.log('Tratamiento eliminado');
    } else {
      console.log(err);
    }
  });
});

module.exports = router;