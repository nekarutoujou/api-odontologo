/*
    Rutas de historias clinicas
    host + /api/historias
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL HISTORIES
router.get('/', (req, res) => {
  pool.query('SELECT * FROM historia_clinica', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando historias');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});

// GET ONE HISTORY
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from historia_clinica WHERE hc_id= ${id} `; 
  pool.query('SELECT * FROM historia_clinica WHERE hc_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando historia '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe historia');
        console.log(err);  
      }
    });
  });
});


// INSERT A HISTORY
router.post('/', async (req, res) => {
  const { hc_pid, hc_tid, hc_amnamesis, hc_comment } = req.body;
  const newHistorias = {
    hc_pid,
    hc_tid,
    hc_amnamesis,
    hc_comment
  };
  await pool.query('INSERT INTO historia_clinica set ?', [newHistorias], (err, rows, fields) => {
    if (!err) {
      res.status(200);
      res.send(newHistorias);
      console.log('Historia guardada')
    } else {
      res.status(400);
      console.log(err);
    }
  });
});


// MODIFY A HISTORY
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  let sql = `Select * from historia_clinica WHERE hc_id= ${id} `; 
  const { hc_pid, hc_tid, hc_amnamesis, hc_comment } = req.body;
  const newHistorias = {
    hc_pid,
    hc_tid,
    hc_amnamesis,
    hc_comment
  };
  await pool.query('UPDATE historia_clinica SET ? WHERE hc_id =?', [newHistorias, id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json({status: 'Historia '+id+' modificada'});
        console.log('Historia '+id+' modificada');         
      }else {
        res.status(400);
        res.send('Error, no existe historia');
        console.log(err);  
      }
  });
  });
});


// MODIFY A HISTORY TYPE OF TREATMENT
router.put('/tipo/:id', async (req, res) => {
  const { id } = req.params;
  let sql = `Select * from historia_clinica WHERE hc_id= ${id} `; 
  const { hc_tid } = req.body;
  const newHistorias = {
    hc_tid
  };
  await pool.query('UPDATE historia_clinica SET ? WHERE hc_id =?', [newHistorias, id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json({status: 'Tipo de tratamiento de la historia '+id+' modificada'});
        console.log('Tipo de tratamiento de la historia '+id+' modificada');         
      }else {
        res.status(400);
        res.send('Error, no existe historia');
        console.log(err);  
      }
  });
  });
});


// DELETE A HISTORY
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM historia_clinica WHERE hc_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Historia clínica eliminada'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;