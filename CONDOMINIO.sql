USE CONDO;

CREATE TABLE VISITANTE(
id_visitante INT(5) NOT NULL UNIQUE,
nome_visitante VARCHAR(50),
CPF  INT(14) NOT NULL UNIQUE,
celular INT(10),
PRIMARY KEY (id_visitante)
);

CREATE TABLE UNIDADE(
id INT(6) NOT NULL UNIQUE,
bloco INT(3) NOT NULL,
nome VARCHAR(50) NOT NULL,
PRIMARY KEY (id)
);

CREATE TABLE RESIDENCIA(
id_res INT(6) NOT NULL UNIQUE,
unidade INT(6) NOT NULL,
PRIMARY KEY (id_res),
FOREIGN KEY (unidade) references UNIDADE(id)
);

CREATE TABLE VISITA(
id_visita INT(5) NOT NULL UNIQUE,
id_res INT(6) NOT NULL,
data_visita DATETIME,
visitante INT(5),
PRIMARY KEY (id_visita),
FOREIGN KEY (visitante) references VISITANTE(id_visitante),
FOREIGN KEY (id_res) references RESIDENCIA(id_res)
);

CREATE TABLE RESIDENTE(
cod_res INT(5) NOT NULL UNIQUE,
nome_residente VARCHAR(50),
residencia INT(6) NOT NULL,
celular INT,
tel_residencial INT,
PRIMARY KEY (cod_res),
FOREIGN KEY (residencia) references RESIDENCIA(id_res)
);

CREATE TABLE CLIENTE(
renavam VARCHAR(9) NOT NULL UNIQUE,
modelo VARCHAR(30) NOT NULL,
placa VARCHAR(7) NOT NULL UNIQUE,
cor VARCHAR(30) NOT NULL,
residencia INT(6) NOT NULL,
PRIMARY KEY (renavam),
FOREIGN KEY (residencia) references RESIDENCIA(id_res)
);

RENAME TABLE CLIENTE TO VEICULO;

INSERT INTO UNIDADE (id,bloco,nome) VALUES ("136579","10","Salamandra");
INSERT INTO UNIDADE (id,bloco,nome) VALUES ("124564","10","Salamandra");
INSERT INTO UNIDADE (id,bloco,nome) VALUES ("156798","10","Salamandra");

INSERT INTO RESIDENCIA(id_res,unidade) VALUES ("219023", "136579");
INSERT INTO RESIDENCIA(id_res,unidade) VALUES ("343568", "124564");
INSERT INTO RESIDENCIA(id_res,unidade) VALUES ("385431", "156798");

INSERT INTO RESIDENTE(cod_res,nome_residente,residencia, celular,tel_residencial) VALUES ("48938","José Santos da Silva","219023","997562042","33633049");
INSERT INTO RESIDENTE(cod_res,nome_residente,residencia, celular,tel_residencial) VALUES ("41902","Marilene Josefina Fidalgo","343568","998764251","33207062"); 
INSERT INTO RESIDENTE(cod_res,nome_residente,residencia, celular,tel_residencial) VALUES ("43259","Karine Massoquim","385431","41997754243","4132673820"); 
 