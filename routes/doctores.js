/*
    Rutas de doctores
    host + /api/doctores
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');

// GET NUMBER OF DOCTORS
router.get('/n', (req, res) => {
  pool.query('SELECT COUNT(*) FROM doctor', (err, result, fields) => {
    if(!err) {
      res.json(result);
      res.status(200);
      console.log('Mostrando número de doctores');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ALL DOCTORS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM doctor', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando doctores');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});

// GET ONE DOCTOR
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from doctor WHERE d_id= ${id}`; 
  pool.query('SELECT * FROM doctor WHERE d_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando doctor '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe doctor');
        console.log(err);  
      }
    });
  });
});


// MODIFY A DOC
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { d_img, d_portfolio, d_name, d_lastname, d_email, d_cellphone, d_gender, d_dni, d_branch, d_npatients, d_codecollege } = req.body;
  const newDoctores = {
    d_img,
    d_portfolio,
    d_name,
    d_lastname,
    d_email,
    d_cellphone,
    d_gender,
    d_dni,
    d_branch,
    d_npatients,
    d_codecollege

  };
  await pool.query('UPDATE doctor SET ? WHERE d_id =?', [newDoctores, id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Doctor '+id+' modificado'});
      console.log('Doctor '+id+' modificado');
    } else {
      res.status(400);
      console.log(err);
    }
    });
});


// DELETE A DOCTOR
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('DELETE FROM auth WHERE auth_id = ? && auth_type = "doctor"', [id], (err, rows, fields) => {
      if(!err) {
        res.status(200);
        res.json({status: 'Doctor eliminado'});
        console.log('Doctor '+id+' eliminado');
      } else {
        res.status(400);
        console.log(err);
      }
    });
  });

module.exports = router;