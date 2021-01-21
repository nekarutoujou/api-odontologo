/*
    Rutas de facturas
    host + /api/facturas
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');

// GET ALL BILLS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM factura', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
      console.log('Mostrando facturas');     
    } else {
      console.log(err);
    }
  });  
});

// GET ONE BILL
router.get('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('SELECT * FROM factura WHERE f_id = ?', [id], (err, rows, fields) => {
        if(!err) {
            res.json(rows);
            console.log('Mostrando factura '+id);
          } else {
            console.log(err);
          }
    });
});



// INSERT A BILL
router.post('/', async (req, res) => {
  const { f_id, f_tpid, f_pid, f_did, f_emission, f_status, f_topay, f_discharged, f_total } = req.body;
  const newFacturas = {
    f_id,
    f_tpid,
    f_pid,
    f_did,
    f_emission,
    f_status,
    f_topay,
    f_discharged,
    f_total
  };
  await pool.query('INSERT INTO factura set ?', [newFacturas], (err, rows, fields) => {
    if (!err) {
      res.send(newFacturas);
      console.log('Factura guardada')
    } else {
      console.log(err);
    }

  });
});


// MODIFY A BILL
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { f_tpid, f_pid, f_did, f_emission, f_status, f_topay, f_discharged, f_total } = req.body;
  const newFacturas = {
    f_tpid,
    f_pid,
    f_did,
    f_emission,
    f_status,
    f_topay,
    f_discharged,
    f_total
  };
  await pool.query('UPDATE factura SET ? WHERE f_id =?', [newFacturas, id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Factura '+id+' modificada'});
      console.log('Factura '+id+' modificada');
    } else {
      console.log(err);
    }
    });
  });

  
// DELETE A BILL
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('DELETE FROM factura WHERE f_id = ?', [id], (err, rows, fields) => {
      if(!err) {
        res.json({status: 'Factura eliminada'});
        console.log('Factura '+id+' eliminada');
      } else {
        console.log(err);
      }
    });
  });



module.exports = router;