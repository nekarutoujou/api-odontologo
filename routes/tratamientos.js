/*
    Rutas de tratamiento_paciente
    host + /api/tratamientos
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');

// GET NUMBER OF TREATMENTS (PATIENT)
router.get('/n', (req, res) => {
  pool.query('SELECT COUNT(*) FROM tratamiento_paciente', (err, result, fields) => {
    if(!err) {
      res.json(result);
      res.status(200);
      console.log('Mostrando número de tratamientos');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ALL TREATMENTS (PATIENT)
router.get('/', (req, res) => {
  pool.query('SELECT * FROM tratamiento_paciente', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando tratamientos de pacientes');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE TREATMENT (PATIENT)
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from tratamiento_paciente WHERE tp_id= ${id} `; 
  pool.query('SELECT * FROM tratamiento_paciente WHERE tp_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando tratamiento de paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe tratamiento para este paciente');
        console.log(err);  
      }
    });
  });
});


// GET ALL TREATMENTS FROM ONE DOCTOR
router.get('/doctor/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from tratamiento_paciente WHERE tp_did = ${id} `; 
  pool.query('SELECT * FROM tratamiento_paciente WHERE tp_did = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando tratamientos que se encarga el doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen tratamientos');
        console.log(err);  
      }
    });
  });
});

// GET ALL TREATMENTS FROM ONE PATIENT
router.get('/patient/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from tratamiento_paciente WHERE tp_pid= ${id} `; 
  pool.query('SELECT * FROM tratamiento_paciente WHERE tp_pid = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando tratamientos que lleva el paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen tratamientos');
        console.log(err);  
      }
    });
  });
});


// INSERT A TREATMENT (PATIENT)
router.post('/', async (req, res) => {
  const { tp_pid, tp_tid, tp_did, tp_description, tp_start, tp_end, tp_ndates} = req.body;
  const newTp = {
    tp_pid,
    tp_tid,
    tp_did,
    tp_description,
    tp_start,
    tp_end,
    tp_ndates
  };
await pool.query('INSERT INTO tratamiento_paciente set ?', [newTp], (err, results) => {
  if (!err) {
    res.status(200);
    res.send(results);
    console.log('Tratamiento (paciente) guardado')
  } else {
    res.status(400);
    console.log(err);
  }
});
});


// MODIFY A TREATMENT (PATIENT)
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  let sql = `Select * from tratamiento_paciente WHERE tp_id= ${id} `; 
  const { tp_pid, tp_tid, tp_did, tp_description, tp_start, tp_end, tp_ndates } = req.body;
  const newTp = {
    tp_pid,
    tp_tid,
    tp_did,
    tp_description,
    tp_start,
    tp_end,
    tp_ndates
  };
  await pool.query('UPDATE tratamiento_paciente SET ? WHERE tp_id =?', [newTp, id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json({status: 'Tratamiento de paciente '+id+' modificado'});
        console.log('Tratamiento de paciente '+id+' modificado');         
      }else {
        res.status(400);
        res.send('Error, no existe paciente');
        console.log(err);  
      }
  });
  });
});


// DELETE A TREATMENT (PATIENT)
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM tratamiento_paciente WHERE tp_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Tratamiento eliminado'});
      console.log('Tratamiento eliminado');
    } else {
      res.status(400);
      console.log(err);
    }
  });
});

module.exports = router;