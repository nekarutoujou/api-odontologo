/*
    Rutas de pacientes por c/ doctor
    host + /api/pacientes
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET ALL PATIENTS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM paciente', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando pacientes');
    } else {
      console.log(err);
    }
  });  
});


// GET ONE PATIENT
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM paciente WHERE p_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando paciente '+id);
          } else {
            console.log(err);
          }
    });
});

// INSERT A PATIENT
router.post('/', async (req, res) => {
  const { p_id, p_doctor, p_name, p_lastname, p_birthday, p_age, p_gender, p_img, p_dni, p_address, p_cellphone, p_email, p_weight, p_height, p_allergy } = req.body;
  const newPacientes = {
    p_id,
    p_doctor,
    p_name,
    p_lastname,
    p_birthday,
    p_age,
    p_gender,
    p_img,
    p_dni,
    p_address,
    p_cellphone,
    p_email,
    p_weight,
    p_height,
    p_allergy
  };
  await pool.query('INSERT INTO paciente set ?', [newPacientes], (err, rows, fields) => {
    if (!err) {
      res.send(newPacientes);
      console.log('Paciente guardado')
    } else {
      console.log(err);
    }
  });
});


// MODIFY A PATIENT
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { p_doctor, p_name, p_lastname, p_birthday, p_age, p_gender, p_img, p_dni, p_address, p_cellphone, p_email, p_weight, p_height, p_allergy } = req.body;
  const newPacientes = {
    p_doctor,
    p_name,
    p_lastname,
    p_birthday,
    p_age,
    p_gender,
    p_img,
    p_dni,
    p_address,
    p_cellphone,
    p_email,
    p_weight,
    p_height,
    p_allergy
  };
  await pool.query('UPDATE paciente SET ? WHERE p_id =?', [newPacientes, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Paciente '+id+' modificado'});
      console.log('Paciente '+id+' modificado');
    } else {
      console.log(err);
    }
    });
  });


// DELETE A PATIENT
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM paciente WHERE p_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Paciente eliminado'});
      console.log('Paciente eliminado');
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
