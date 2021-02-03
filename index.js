const express = require('express');
const mysql = require('mysql');
const cors = require('cors');
var bodyParser = require('body-parser');
var cookieParser = require('cookie-parser');

// Intializations
const app = express();

// Authenthication package

// settings
app.set('port', process.env.PORT || 3000);

// middlewares
app.use(express.json());
app.use(cors());
app.use(cookieParser());

app.use(bodyParser.urlencoded({extended : true}));
app.use(bodyParser.json());


//routes
app.use('/api/solicitudes', require ('./routes/solicitudes.js'));
app.use('/api/auth', require('./routes/auth.js'));
app.use('/api/admin', require('./routes/admin.js'));
app.use('/api/doctores', require('./routes/doctores.js'));
app.use('/api/pacientes', require('./routes/pacientes.js'));
app.use('/api/tipos', require('./routes/tipos.js'));
app.use('/api/tratamientos', require('./routes/tratamientos.js'));
app.use('/api/historias', require('./routes/historias.js'));
app.use('/api/odontogramas', require('./routes/odontogramas.js'));
app.use('/api/citas', require('./routes/citas.js'));
app.use('/api/facturas', require('./routes/facturas.js'));

// starting the server

app.listen(app.get('port'), () =>{
    console.log('Servidor en el puerto ', app.get('port'));
});