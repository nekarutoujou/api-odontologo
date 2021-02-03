CREATE DATABASE IF NOT EXISTS projectodonto;
USE projectodonto;

CREATE TABLE solicitud (
s_id INT AUTO_INCREMENT,
s_fullname VARCHAR(200),
s_cellphone VARCHAR(100),
s_query VARCHAR (500),
PRIMARY KEY (s_id)
);

ALTER TABLE solicitud AUTO_INCREMENT=9000;

INSERT INTO solicitud values
(9000, 'Mollie Small', '202-555-0173', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(9001, 'Mitchell Howells', '202-555-0147', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent non mi quis arcu semper fermentum.'),
(9002, 'Angelina Mccormack', '202-555-0160', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');


CREATE TABLE auth (
auth_id INT AUTO_INCREMENT,
auth_user VARCHAR(100),
auth_password VARCHAR(100),
auth_type VARCHAR(100),
PRIMARY KEY (auth_id) 
);

ALTER TABLE auth AUTO_INCREMENT=1000;

INSERT INTO auth values
(1000, 'Ricardo', 'tommy23', 'adm'),
(1001, 'EsthebanCG', 'esthebanxD', 'adm'),
(1002, 'Fernando2000', 'SoyAdmin123', 'adm'),
(1003, 'MadinaGuerrero', 'Madina123', 'doctor'),
(1004, 'RomeoYoder', 'Romeo123', 'doctor'),
(1005, 'SullivanLong', 'LingLong', 'doctor');


CREATE TABLE adm (
a_id INT NOT NULL,
a_name VARCHAR(100),
a_lastname VARCHAR(100),
a_lastlogin DATETIME,
FOREIGN KEY (a_id) REFERENCES auth(auth_id) ON DELETE CASCADE
);

INSERT INTO adm values
(1000, 'Ricardo', 'Cancino', '2021-01-01 20:00:00'),
(1001, 'Estheban', 'Curi', '2021-01-02 16:00:00'),
(1002, 'Fernando', 'Gavilán', '2021-01-03 04:00:00');


CREATE TABLE doctor (
d_id INT NOT NULL,
d_img VARCHAR(500),
d_portfolio VARCHAR(500),
d_name VARCHAR(100),
d_lastname VARCHAR(100),
d_email VARCHAR(100),
d_cellphone VARCHAR(100),
d_gender VARCHAR(100),
d_dni VARCHAR(100),
d_branch VARCHAR(100),
d_npatients INT,
d_codecollege VARCHAR(200),
FOREIGN KEY (d_id) REFERENCES auth(auth_id) ON DELETE CASCADE
);

INSERT INTO doctor values
(1003, 'https://i1.wp.com/oralmederi.com/wp-content/uploads/2016/07/MARYAG.jpg?fit=500%2C500&ssl=1', 'https://dina.concytec.gob.pe/appDirectorioCTI/VerDatosInvestigador.do?id_investigador=45798', 'Madina', 'Guerrero', 'madinaguerrero@dentalhealth.com', '256-555-0197', 'Mujer', '45815836C', 'Prótesis', 1, '748013331'),
(1004, 'https://www.crhoy.com/wp-content/uploads/2019/01/Captura-de-pantalla-2019-01-03-a-las-10.48.27.png', 'https://dina.concytec.gob.pe/appDirectorioCTI/VerDatosInvestigador.do?id_investigador=39453', 'Romeo ', 'Yoder', 'romeoyoder@dentalhealth.com' , '256-555-0158', 'Hombre', '94738323N', 'Estética Dental', 2, '696718111'),
(1005, 'https://www.sofiaweb.com/wp-content/uploads/2020/01/485165_PR_130_SI_24_06_14_255-m.png', 'http://dina.concytec.gob.pe/appDirectorioCTI/VerDatosInvestigador.do;jsessionid=675d310e3168e63b20b94721a476?id_investigador=95979', 'Sullivan ', 'Long', 'sullivanlong@dentalhealth.com' , '256-555-0158', 'Hombre', '61888890F', 'Ortodoncia', 3, '315245310');

CREATE TABLE paciente (
p_id INT AUTO_INCREMENT,
p_name VARCHAR(100),
p_lastname VARCHAR(100),
p_birthday DATE, 
p_age INT NOT NULL,
p_gender VARCHAR(100),
p_img VARCHAR(500),
p_dni VARCHAR(100),
p_address VARCHAR (100),
p_cellphone VARCHAR(100),
p_email VARCHAR(100),
p_weight FLOAT,
p_height FLOAT,
p_allergy VARCHAR(100),
PRIMARY KEY (p_id)
);

ALTER TABLE paciente AUTO_INCREMENT=2000;

INSERT INTO paciente VALUES
(2000, 'Star', 'Mckenzie', '1990-06-20', 31, 'Mujer', 'https://www.prensalibre.com/wp-content/uploads/2018/12/685f8470-ec53-410e-83ea-5e30c4319a40.jpg?quality=82&w=760&h=430&crop=1', '810553104', '3500 Emily Drive', '330-485-0970', 'uddwuxjfg7@temporary-mail.net', 74.1, 169, 'Alpramid'),
(2001, 'Scarlett', 'Reese', '1991-06-18', 30, 'Mujer', 'https://www.dzoom.org.es/wp-content/uploads/2020/02/portada-foto-perfil-redes-sociales-consejos.jpg', '549065934', '3324 Douglas Dairy Road', '307-748-2942', 'e805qhngews@temporary-mail.net', 77.3, 188, 'Aprofranil'),
(2002, 'Dominick', 'Gross', '1993-04-20', 28, 'Hombre', 'https://tecno.americaeconomia.com/sites/tecno.americaeconomia.com/files/styles/photo_inline/public/phone-875488_1280.jpg?itok=W-7DTTg_', '814357693', '794 Wayback Lane', '206-645-8632', 'kwc245tvn29@temporary-mail.net', 62.19, 169, 'Humuxolol'),
(2003, 'Haya', 'Hough', '1999-03-10', 22, 'Mujer', 'https://socialtools.me/wp-content/uploads/2016/04/foto-de-perfil.jpg', '373684157', '1224 Jett Lane', '225-356-0165', '98q0k67rl4o@temporary-mail.net', 66.77, 169, 'Benzoran'),
(2004, 'Jade', 'Collins', '2000-07-05', 21, 'Mujer', 'https://i.pinimg.com/originals/fc/c5/49/fcc549667aaa2c5ebbd15e9bd04896fe.jpg', '640770957', '3800 Findley Avenue', '651-365-3659', 'wgop0c5kuip@temporary-mail.net', 83.7, 180, 'Nalolovir'),
(2005, 'Hal', 'Prince', '2000-12-08', 21, 'Hombre', 'https://us.123rf.com/450wm/tverdohlib/tverdohlib1510/tverdohlib151000858/46565579-vista-lateral-del-primer-de-un-hombre-mayor-hermoso-con-el-pelo-negro-y-largo-exuberante-barba-en-ca.jpg?ver=6', '244407450', '2480  Rainbow Drive', '313-584-4128', 'rfwjb2i6gu@temporary-mail.net', 76.9, 167, 'Megalinum');


CREATE TABLE tipo_tratamiento (
t_id INT AUTO_INCREMENT,
t_name VARCHAR(100),
t_description VARCHAR(500),
t_price FLOAT,
PRIMARY KEY (t_id)
);

ALTER TABLE tipo_tratamiento AUTO_INCREMENT=3000;

INSERT INTO tipo_tratamiento values
(3000, 'Diagnóstico y Prevención', 'En odontología prevenir es literalmente curar. Un diagnóstico a tiempo te ayudará a evitar patologías bucodentales más graves en el futuro.', 200),
(3001, 'Ortodoncia','Los tratamientos de ortodoncia realizan suaves movimientos que desplazan los dientes de forma individual o en bloque y corrigen su colocación.',800),
(3002, 'Implantes', 'En la Clínica Dental DentalHealth la implantología la realizan odontólogos altamente cualificados que cuentan para su trabajo con la tecnología más avanzada.', 1000),
(3003, 'Odontopediatría','La Odontopediatría es la rama de la Odontología encargada de tratar a los niños. El odontopediatra será, por tanto, el encargado de explorar y tratar a niños y adolescentes.', 400),
(3004, 'Estética Dental','En Sanitas Dental ponemos a su disposición diferentes tratamientos odontológicos sencillos e indoloros que te ayudarán a mejorar la salud y apariencia de su boca.', 1200),
(3005, 'Periodoncia','La salud de las encías es tan importante como la de las piezas dentales. Un cuidado deficiente de las encías puede derivar en patologías como la gingivitis o la periodontitis.', 400),
(3006, 'Prótesis','Es el elemento artificial destinado a restaurar la anatomía de una o varias piezas dentarias, restaurando también la relación entre los maxilares, a la vez que repone los dientes.', 1000),
(3007, 'Caries','La odontología conservadora tiene como objetivo la conservación de los dientes y del tejido dental sano, evitando siempre que sea posible la extracción de las piezas afectadas.', 400),
(3008, 'Bruxismo','El bruxismo consiste en apretar de forma inconsciente la mandíbula o incluso rechinar los dientes, generalmente mientras dormimos. Esto nos puede acarrear un desgaste en los dientes, dolor muscular o cefalea.', 600),
(3009, 'Sensibilidad dental','La sensibilidad dental es una de las molestias dentales más frecuente entre la población. Puede ser el primer síntoma de otras patologías que, si se diagnostican de forma rápida, pueden ser tratadas eficazmente.', 600),
(3010, 'Halitosis','La halitosis o mal aliento puede producirse por una deficiente higiene oral, aunque el hecho de fumar, beber alcohol o comer alimentos de sabor fuerte favorecen la misma.', 400),
(3011, 'Tratamiento antirronquidos','Un tratamiento odontológico es efectivo en casos leves y moderados de ronquidos o apnea del sueño. Se realiza mediante férulas de adelantamiento mandibular que modifican la posición de la mandíbula y la lengua.', 400);


CREATE TABLE tratamiento_paciente (
tp_id INT AUTO_INCREMENT,
tp_pid INT NOT NULL,
tp_tid INT NOT NULL,
tp_did INT NOT NULL,
tp_description VARCHAR(500),
tp_start DATE,
tp_end DATE,
tp_ndates INT,
PRIMARY KEY (tp_id),
FOREIGN KEY (tp_pid) REFERENCES paciente(p_id) ON DELETE CASCADE,
FOREIGN KEY (tp_tid) REFERENCES tipo_tratamiento(t_id),
FOREIGN KEY (tp_did) REFERENCES doctor(d_id)
);

ALTER TABLE tratamiento_paciente AUTO_INCREMENT=4000;

INSERT INTO tratamiento_paciente VALUES
(4000, 2000, 3009, 1003, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-11-26', '2021-01-15', 3),
(4001, 2001, 3000, 1004, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-12-24', '2021-01-21', 2),
(4002, 2002, 3001, 1004, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-11-17', '2021-01-07', 3),
(4003, 2003, 3002, 1005, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-11-30', '2021-02-24', 3),
(4004, 2004, 3004, 1005, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-11-24', '2021-01-05', 3),
(4005, 2005, 3007, 1005, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', '2020-12-23', '2021-02-25', 2);


CREATE TABLE historia_clinica (
hc_id INT AUTO_INCREMENT,
hc_pid INT NOT NULL,
hc_tid INT NOT NULL,
hc_amnamesis VARCHAR(500),
hc_comment VARCHAR(500),
PRIMARY KEY (hc_id),
FOREIGN KEY (hc_pid) REFERENCES paciente(p_id) ON DELETE CASCADE,
FOREIGN KEY (hc_tid) REFERENCES tipo_tratamiento(t_id) ON DELETE CASCADE
);

ALTER TABLE historia_clinica AUTO_INCREMENT=5000;

INSERT INTO historia_clinica VALUES
(5000, 2000, 3009, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...'),
(5001, 2001, 3000, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...'),
(5002, 2002, 3001, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...'),
(5003, 2003, 3002, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...'),
(5004, 2004, 3004, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...'),
(5005, 2005, 3007, 'https://colodontcba.org.ar/wp-content/uploads/Docs/Anexo-Odontopediatria.pdf', '...');

CREATE TABLE odontograma (
o_id INT AUTO_INCREMENT,
o_hc INT NOT NULL,
o_datecapture DATE,
o_teethcollection JSON,
o_remark VARCHAR(500),
PRIMARY KEY (o_id),
FOREIGN KEY (o_hc) REFERENCES historia_clinica(hc_id) ON DELETE CASCADE
);

ALTER TABLE odontograma AUTO_INCREMENT=6000;

INSERT INTO odontograma VALUES
(6000, 5000, '2020-11-26', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6001, 5001, '2020-12-24', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6002, 5002, '2020-11-17', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6003, 5003, '2020-11-30', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6004, 5004, '2020-11-24', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
(6005, 5005, '2020-12-23', '[
  {
    "id":"num18",
    "numero":18,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num17",
    "numero":17,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num16",
    "numero":16,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num15",
    "numero":15,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num14",
    "numero":14,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num13",
    "numero":13,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num12",
    "numero":12,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num11",
    "numero":11,
    "cuadrante":"Primer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num21",
    "numero":21,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num22",
    "numero":22,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num23",
    "numero":23,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num24",
    "numero":24,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"",
      "Mesial":"",
      "Distal":"caries"
    }
  },
  {
    "id":"num25",
    "numero":25,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num26",
    "numero":26,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num27",
    "numero":27,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":"restauración en buen estado"
    }
  },
  {
    "id":"num28",
    "numero":28,
    "cuadrante":"Segundo Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"",
      "Mesial":"restauración en buen estado",
      "Distal":""
    }
  },
  {
    "id":"num48",
    "numero":48,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num47",
    "numero":47,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num46",
    "numero":46,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num45",
    "numero":45,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num44",
    "numero":44,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"caries",
      "Lingual":"caries",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num43",
    "numero":43,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"caries","Distal":""}
  },
  {
    "id":"num42",
    "numero":42,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num41",
    "numero":41,
    "cuadrante":"Cuarto Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num31",
    "numero":31,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Central",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num32",
    "numero":32,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Incisivo Lateral",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num33",
    "numero":33,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Canino",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num34",
    "numero":34,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num35",
    "numero":35,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Premolar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num36",
    "numero":36,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Primer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  },
  {
    "id":"num37",
    "numero":37,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Segundo Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{
      "Vestibular":"",
      "Oclusal":"restauración en buen estado",
      "Lingual":"restauración en buen estado",
      "Mesial":"",
      "Distal":""
    }
  },
  {
    "id":"num38",
    "numero":38,
    "cuadrante":"Tercer Cuadrante",
    "nombre":"Tercer Molar",
    "estado":"Presente en Boca",
    "hallazgo":"",
    "caras":{"Vestibular":"","Oclusal":"","Lingual":"","Mesial":"","Distal":""}
  }
]', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.');

CREATE TABLE cita (
c_id INT AUTO_INCREMENT,
c_did INT NOT NULL,
c_pid INT NOT NULL,
c_tpid INT NOT NULL,
c_title  VARCHAR(100),
c_description VARCHAR(500),
c_start DATETIME,
c_end DATETIME,
c_status VARCHAR(100),
PRIMARY KEY (c_id),
FOREIGN KEY (c_tpid) REFERENCES tratamiento_paciente(tp_id) ON DELETE CASCADE,
FOREIGN KEY (c_pid) REFERENCES paciente(p_id) ON DELETE CASCADE,
FOREIGN KEY (c_did) REFERENCES doctor(d_id) ON DELETE CASCADE
);

ALTER TABLE cita AUTO_INCREMENT=7000;

INSERT INTO cita VALUES
(7000, 1003, 2000, 4000, '1. Mckenzie - Sensibilidad dental', 'Cita 1', '2020-11-26 14:00:00', '2020-11-26 16:00:00', '...'),
(7001, 1003, 2000, 4000, '2. Mckenzie - Sensibilidad dental', 'Cita 2', '2020-12-18 10:00:00', '2020-12-18 12:00:00', '...'),
(7002, 1003, 2000, 4000, '3. Mckenzie - Sensibilidad dental', 'Cita 3', '2021-01-15 08:00:00', '2021-01-15 10:00:00', '...'),
(7003, 1004, 2001, 4001, '1. Reese - Diagnóstico', 'Cita 1', '2020-12-24 16:00:00', '2020-12-24 18:00:00', '...'),
(7004, 1004, 2001, 4001, '2. Reese - Prevención', 'Cita 2', '2021-01-21 12:00:00', '2021-01-21 14:00:00', '...'),
(7005, 1004, 2002, 4002, '1. Gross - Ortodoncia', 'Cita 1', '2020-11-17 10:00:00', '2020-11-17 12:00:00',  '...'),
(7006, 1004, 2002, 4002, '2. Gross - Ortodoncia', 'Cita 2', '2020-11-27 14:00:00', '2020-11-27 16:00:00', '...'),
(7007, 1004, 2002, 4002, '3. Gross - Ortodoncia', 'Cita 3', '2021-01-07 10:00:00', '2021-01-07 12:00:00', '...'),
(7008, 1005, 2003, 4003, '1. Hough - Implantes', 'Cita 1', '2020-11-30 08:00:00', '2020-11-30 10:00:00', '...'),
(7009, 1005, 2003, 4003, '2. Hough - Implantes', 'Cita 2', '2020-11-28 16:00:00', '2020-11-28 18:00:00', '...'),
(7010, 1005, 2003, 4003, '3. Hough - Implantes', 'Cita 3', '2021-02-24 12:00:00', '2021-02-24 14:00:00', '...'),
(7011, 1005, 2004, 4004, '1. Collins - Estética Dental', 'Cita 1', '2020-11-24 10:00:00', '2020-11-24 12:00:00', '...'),
(7012, 1005, 2004, 4004, '2. Collins - Estética Dental', 'Cita 2', '2020-12-26 14:00:00', '2020-12-26 16:00:00', '...'),
(7013, 1005, 2004, 4004, '3. Collins - Estética Dental', 'Cita 3', '2021-01-05 10:00:00', '2021-01-05 12:00:00', '...'),
(7014, 1005, 2005, 4005, '1. Prince - Caries', 'Cita 1', '2020-12-23 16:00:00', '2020-12-23 18:00:00', '...'),
(7015, 1005, 2005, 4005, '2. Prince - Caries', 'Cita 2', '2021-02-25 12:00:00', '2021-02-25 14:00:00', '...');

CREATE TABLE factura (
f_id INT AUTO_INCREMENT,
f_tpid INT NOT NULL,
f_pid INT NOT NULL,
f_did INT NOT NULL,
f_emission DATE,
f_status VARCHAR(100),
f_total FLOAT,
f_discharged FLOAT,
f_topay FLOAT,
PRIMARY KEY (f_id),
FOREIGN KEY (f_tpid) REFERENCES tratamiento_paciente(tp_id),
FOREIGN KEY (f_pid) REFERENCES paciente(p_id),
FOREIGN KEY (f_did) REFERENCES doctor(d_id)
);

ALTER TABLE factura AUTO_INCREMENT=8000;

INSERT INTO factura VALUES
(8000, 4000, 2000, 1003, '2020-11-26', 'Pendiente', 1400, 200, 1200),
(8001, 4001, 2001, 1004, '2020-12-24', 'Cancelado', 700, 700, 0),
(8002, 4002, 2002, 1004, '2020-11-17', 'Pendiente', 878.99, 600.32, 278.67),
(8003, 4003, 2003, 1005, '2020-11-30', 'Pendiente', 1200, 300, 900),
(8004, 4004, 2004, 1005, '2020-11-24', 'Pendiente', 700, 600.99, 99.01),
(8005, 4005, 2005, 1005, '2020-12-23', 'Pendiente', 1100.99, 900.5, 200.49);

SHOW TABLES;

DROP TABLE factura;
DROP TABLE cita;
DROP TABLE odontograma;
DROP TABLE historia_clinica;
DROP TABLE tratamiento_paciente;
DROP TABLE tipo_tratamiento;
DROP TABLE paciente;
DROP TABLE adm;
DROP TABLE doctor;
DROP TABLE auth;
DROP TABLE solicitud;