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
      res.json(rows);
      console.log('Mostrando historias');
    } else {
      console.log(err);
    }
  });  
});

// GET ONE HISTORY
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM historia_clinica WHERE hc_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando historia '+id);
          } else {
            console.log(err);
          }
    });
});

// INSERT A HISTORY
router.post('/', async (req, res) => {
  const { hc_id, hc_pid, hc_tpid, hc_amnamesis, hc_comment } = req.body;
  const newHistorias = {
    hc_id,
    hc_pid,
    hc_tpid,
    hc_amnamesis,
    hc_comment
  };
  await pool.query('INSERT INTO historia_clinica set ?', [newHistorias], (err, rows, fields) => {
    if (!err) {
      res.send(newHistorias);
      console.log('Historia guardada')
    } else {
      console.log(err);
    }
  });
});


// MODIFY A HISTORY
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { hc_pid, hc_tpid, hc_amnamesis, hc_comment } = req.body;
  const newHistorias = {
    hc_pid,
    hc_tpid,
    hc_amnamesis,
    hc_comment
  };
  await pool.query('UPDATE historia_clinica SET ? WHERE hc_id =?', [newHistorias, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Historia '+id+' modificada'});
      console.log('Historia '+id+' modificada');
    } else {
      console.log(err);
    }
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