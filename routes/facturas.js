/*
    Rutas de facturas
    host + /api/facturas
*/

const express = require('express');
const router = express.Router();
const pool = require('../database/database');


// GET earnings per month
router.get('/month', (req, res) => {
  pool.query('SELECT SUM(f_total) as total, MONTHNAME(f_emission) AS Mes FROM factura GROUP BY Mes', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando ganancias por mes');     
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});


// GET ALL BILLS
router.get('/', (req, res) => {
  pool.query('SELECT * FROM factura', (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json(rows);
      console.log('Mostrando facturas');     
    } else {
      res.status(400);
      console.log(err);
    }
  });  
});

// GET ONE BILL
router.get('/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from factura WHERE f_id= ${id} `; 
  pool.query('SELECT * FROM factura WHERE f_id = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando factura '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe factura');
        console.log(err);  
      }
    });
  });
});

/*
// GET TO PAY FOR A PATIENT
router.get('/topay/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from factura WHERE f_id= ${id} `; 
  pool.query('SELECT f_topay FROM factura where f_pid = ? ORDER BY f_id DESC LIMIT 1', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando pago faltante de '+id);         
      }else {
        res.status(400);
        res.send('Error, no existe factura');
        console.log(err);  
      }
    });
  });
});
*/

// INSERT A BILL
router.post('/', async (req, res) => {
  const { f_tpid, f_pid, f_did, f_emission, f_status, f_total, f_discharged, f_topay } = req.body;
  const newFacturas = {
    f_tpid,
    f_pid,
    f_did,
    f_emission,
    f_status,
    f_total,
    f_discharged,
    f_topay
  };
  await pool.query('INSERT INTO factura set ?', [newFacturas], (err, rows, fields) => {
    if (!err) {
      res.status(200);
      res.send(newFacturas);
      console.log('Factura guardada')
    } else {
      res.sendStatus(400);
      console.log(err);
    }
  });
});

// MODIFY A BILL
router.put('/:id', async (req, res) => {
  const { id } = req.params;
  const { f_tpid, f_pid, f_did, f_emission, f_status, f_total, f_discharged, f_topay } = req.body;
  const newFacturas = {
    f_tpid,
    f_pid,
    f_did,
    f_emission,
    f_status,
    f_total,
    f_discharged,
    f_topay
  };
  await pool.query('UPDATE factura SET ? WHERE f_id =?', [newFacturas, id], (err, rows, fields) => {
    if(!err) {
      res.status(200);
      res.json({status: 'Factura '+id+' modificada'});
      console.log('Factura '+id+' modificada');
    } else {
      res.status(400);
      console.log(err);
      res.send('Error, no existe factura');
    }
    });
});


// GET ALL BILLS FROM ONE PATIENT
router.get('/patient/:id', (req, res) => {
  const { id } = req.params;
  let sql = `Select * from factura WHERE f_pid= ${id} `; 
  pool.query('SELECT * FROM factura WHERE f_pid = ?', [id], (err, rows, fields) => {
    pool.query(sql, function (err, result) {
      if (err) throw err;  
      if (result.length){
        res.status(200);
        res.json(rows);
        console.log('Mostrando facturas del paciente '+id);         
      }else {
        res.status(400);
        res.send('Error, no existen facturas');
        console.log(err);  
      }
    });
  });
});


// MODIFY A BILL STATUS
router.put('/status/:id', async (req, res) => {
  const { id } = req.params;
  const { f_status, f_total, f_discharged, f_topay } = req.body;
  let sql = `Select * from factura WHERE f_id= ${id} `; 
  const newFacturas = {
    f_status,
    f_topay,
    f_discharged,
    f_total
  };
  await pool.query('UPDATE factura SET ? WHERE f_id =?', [newFacturas, id], (err, rows, fields) => {
      pool.query(sql, function (err, result) {
        if (err) throw err;  
        if (result.length){
          res.status(200);
          res.json({status: 'Factura '+id+' modificada'});
          console.log('Factura '+id+' modificada');         
        }else {
          res.status(400);
          res.send('Error, no existe factura');
          console.log(err);  
        }
    });
    });
  });

  
// DELETE A BILL
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    pool.query('DELETE FROM factura WHERE f_id = ?', [id], (err, rows, fields) => {
      if(!err) {
        res.status(200);
        res.json({status: 'Factura eliminada'});
        console.log('Factura '+id+' eliminada');
      } else {
        res.status(400);
        console.log(err);
      }
    });
  });

module.exports = router;