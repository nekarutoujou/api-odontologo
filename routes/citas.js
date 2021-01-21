/*
    Rutas de citas
    host + /api/citas
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL APPOINTMENTS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM cita', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando todas las citas');
    } else {
      console.log(err);
    }
  });  
});

// GET ONE APPOINTMENT
router.get('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('SELECT * FROM cita WHERE c_id = ?', [id], (err, rows, fields) => {
      if(!err) {
          res.json(rows);
          console.log('Mostrando cita ' + id);
        } else {
          console.log(err);
        }
  });
});

// INSERT AN APPOINTMENT
router.post('/', async (req, res) => {
  const { c_id, c_did, c_pid, c_tpid, c_title, c_description, c_start, c_end, c_status } = req.body;
  const newCitas = {
    c_id,
    c_did,
    c_pid,
    c_tpid,
    c_title,
    c_description,
    c_start,
    c_end,
    c_status
  };
  await pool.query('INSERT INTO cita set ?', [newCitas], (err, rows, fields) => {
    if (!err) {
      res.send(newCitas);
      console.log('Cita guardada')
    } else {
      console.log(err);
    }

  });
});


// MODIFY AN APPOINTMENT
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { c_pid, c_did, c_tpid, c_title, c_description, c_start, c_end, c_status } = req.body;
  const newCitas = {
    c_did,
    c_pid,
    c_tpid,
    c_title,
    c_description,
    c_start,
    c_end,
    c_status
  };
  await pool.query('UPDATE cita SET ? WHERE c_id =?', [newCitas, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Cita '+id+' modificada'});
      console.log('Cita '+id+' modificada');
    } else {
      console.log(err);
    }
    });
});


// DELETE AN APPOINTMENT
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM cita WHERE c_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Cita eliminada'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;