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
      res.status(200);
      res.json(rows);
      console.log('Mostrando todas las citas');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});

// GET ONE APPOINTMENT
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_id= ${id} `; 
  pool.query('SELECT * FROM cita WHERE c_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando cita '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe cita');
        console.log(err);  
      }
    });
  });
});


// GET ALL APPOINTMENT FROM ONE PATIENT
router.get('/paciente/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_pid= ${id} `; 
  pool.query('SELECT * FROM cita WHERE c_pid = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando citas del paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen citas');
        console.log(err);  
      }
    });
  });
});


// GET ALL APPOINTMENT FROM ONE DOCTOR
router.get('/doctor/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_did= ${id} `; 
  pool.query('SELECT * FROM cita WHERE c_did = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando citas del doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen citas');
        console.log(err);  
      }
    });
  });
});


// GET LAST THREE APPOINTMENT FROM ONE DOCTOR
router.get('/doctor/lastdates/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_did= ${id} `; 
  pool.query('SELECT * FROM cita where c_did = ? ORDER BY c_id DESC LIMIT 3', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando citas del doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen citas');
        console.log(err);  
      }
    });
  });
});


// GET ALL APPOINTMENT FROM ONE TREATMENT
router.get('/tratamiento/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_tpid= ${id} `; 
  pool.query('SELECT * FROM cita WHERE c_tpid = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando citas del tratamiento '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen citas para este tratamiento');
        console.log(err);  
      }
    });
  });
});


// INSERT AN APPOINTMENT
router.post('/', async (req, res) => {
  const { c_did, c_pid, c_tpid, c_title, c_description, c_start, c_end, c_status } = req.body;
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
  await pool.query('INSERT INTO cita set ?', [newCitas], (err, rows, fields) => {
    if (!err) {
      res.status(200);
      res.send(newCitas);
      console.log('Cita guardada')
    } else {
      res.status(400);
      console.log(err);
    }
  });
});


// MODIFY AN APPOINTMENT
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  let sql = `Select * from cita WHERE c_id= ${id} `; 
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
  pool.query(sql, function (err, result) {
    if (err) throw err;  
    if (result.length){
      res.status(200);
      res.json({status: 'Cita '+id+' modificada'});
      console.log('Cita '+id+' modificada');         
    }else {
      res.status(400);
      res.send('Error, no existe Cita');
      console.log(err);  
    }
});
});
});


// DELETE AN APPOINTMENT
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM cita WHERE c_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Cita eliminada'});
    } else {
      res.status(400);
      console.log(err);
    }
  });
});

module.exports = router;