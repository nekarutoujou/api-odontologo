/*
    Rutas de pacientes por c/ doctor
    host + /api/pacientes
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');

// GET NUMBER OF PATIENTS
router.get('/n', (req, res) => {
  pool.query('SELECT COUNT(*) FROM paciente', (err, result, fields) => {
    if(!err) {
      res.json(result);
      res.status(200);
      console.log('Mostrando número de pacientes');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ALL PATIENTS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM paciente', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      res.status(200);
      console.log('Mostrando pacientes');
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ONE PATIENT
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from paciente WHERE p_id= ${id} `; 
  pool.query('SELECT * FROM paciente WHERE p_id = ?', [id], (err, results, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(results);
        console.log('Mostrando paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe paciente');
        console.log(err);  
      }
    });
  });
});

/*
// GET SPECIFIC DATA FOR ONE PATIENT
router.get('/data/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from paciente WHERE p_id= ${id} `; 
  pool.query('SELECT p_id, p_img, p_age, p_cellphone FROM paciente WHERE p_id = ?', [id], (err, results, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe paciente');
        console.log(err);  
      }
    });
  });
});
*/

// INSERT AN PATIENT
router.post('/', async (req, res) => {
  const { p_name, p_lastname, p_birthday, p_age, p_gender, p_img, p_dni, p_address, p_cellphone, p_email, p_weight, p_height, p_allergy} = req.body;
  const newPacientes = {
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
await pool.query('INSERT INTO paciente set ?', [newPacientes], (err, results) => {
  if (!err) {
    res.status(200);
    res.send(results);
    console.log('Paciente guardado')
  } else {
    res.status(400);
    console.log(err);
  }
});
});


// MODIFY A PATIENT
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { p_name, p_lastname, p_birthday, p_age, p_gender, p_img, p_dni, p_address, p_cellphone, p_email, p_weight, p_height, p_allergy } = req.body;
  const newPacientes = {
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
      res.status(200);
      res.json({status: 'Paciente '+id+' modificado'});
      console.log('Paciente '+id+' modificado'); 
    } else {
      res.status(400);
      res.send('Error, no existe paciente');
      console.log(err); 
    }
  });
});


// DELETE A PATIENT
router.delete('/:id', (req, res) => {
  const { id } = req.params;
  pool.query('DELETE FROM paciente WHERE p_id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Paciente eliminado'});
      console.log('Paciente eliminado');
    } else {
      res.status(400);
      console.log(err);
    }
  });
});

module.exports = router;
