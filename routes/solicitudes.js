/*
    Rutas de solicitudes
    host + /api/solicitudes
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL REQUESTS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM solicitud', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando solicitudes');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});

// GET ONE REQUEST
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from solicitud WHERE s_id= ${id} `; 
  pool.query('SELECT * FROM solicitud WHERE s_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando solicitud '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe solicitud');
        console.log(err);  
      }
    });
  });
});


// INSERT AN APPOINTMENT
router.post('/', async (req, res) => {
  const { s_fullname, s_cellphone, s_query } = req.body;
  const newSolicitudes = {
    s_fullname,
    s_cellphone,
    s_query
  };
  await pool.query('INSERT INTO solicitud set ?', [newSolicitudes], (err, rows, fields) => {
    if (!err) {
      res.status(200);
      res.send(newSolicitudes);
      console.log('Solicitud guardada')
    } else {
      res.status(400);
      console.log(err);
    }

  });
});


// DELETE AN APPOINTMENT
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM solicitud WHERE s_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Solicitud eliminada'});
    } else {
      res.status(400);
      console.log(err);
    }
  });
});

module.exports = router;