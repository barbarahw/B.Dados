CREATE TABLE departamento (
    IDDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR (100),
    Sigla VARCHAR (10)
);

CREATE TABLE curso (
    IDCurso INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Sigla VARCHAR(10),
    CargaHoraria INTEGER,
    IDDepartamento INTEGER,
    FOREIGN KEY (IDDepartamento) REFERENCES departamento (IDDepartamento)
);


CREATE TABLE equipamento (
    IDEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    Nome varchar (100),
    QuantExistente INT
);

CREATE TABLE sala (
    IDSala INT PRIMARY KEY AUTO_INCREMENT,
    Sigla VARCHAR(10),
    TipoSala VARCHAR (100),
    Capacidade INT,
    IDDepartamento INT,
    FOREIGN KEY (IDDepartamento) REFERENCES departamento (IDDepartamento)
);

CREATE TABLE salaEquipamento (
    IDEquipamento INT PRIMARY KEY AUTO_INCREMENT,
    IDSala INT,
    QuantAlocada INT,
    FOREIGN KEY (IDSala) REFERENCES sala (IDSala)
);

CREATE TABLE endereco (
    IDEndereco INT PRIMARY KEY AUTO_INCREMENT,
    UF VARCHAR(80),
    Cidade VARCHAR(80),
    Bairro VARCHAR(80),
    Rua VARCHAR(80),
    CEP CHAR(15)
);


CREATE TABLE funcionario (
    IDFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(14),
    Email VARCHAR(100),
    DataAdmissao DATE,
    DataDemissao DATE,
    Salario DECIMAL(10,2),
    IDDepartamento INT,
    IDEndereco INT,
    FOREIGN KEY (IDDepartamento) REFERENCES departamento (IDDepartamento),
    FOREIGN KEY (IDEndereco) REFERENCES endereco (IDEndereco)
);


CREATE TABLE evento (
    IDEvento INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao VARCHAR(200),
    Sigla VARCHAR(10)
);

CREATE TABLE alocacao (
    IDAlocacao INT PRIMARY KEY AUTO_INCREMENT,
    IDEvento INT,
    IDSala INT,
    DataAlocacao DATE,
    DtaInicioReserva DATE,
    DataTerminoReserva DATE,
    HoraInicioReserva TIME,
    FOREIGN KEY (IDEvento) REFERENCES evento (IDEvento),
    FOREIGN KEY (IDSala) REFERENCES sala (IDSala)
);

INSERT INTO endereco (UF, CIDADE, BAIRRO, RUA, CEP)
	VALUES ('PR', 'Curitiba', 'Centro', 'Rua XV de Novembro', '80020-310'),
	('PR', 'Londrina', 'Centro', 'Rua Sergipe', '86010-320'),
	('PR', 'Maringá', 'Zona 01', 'Avenida Brasil', '87013-000'),
	('PR', 'Foz do Iguaçu', 'Vila Yolanda', 'Rua Edmundo de Barros', '85863-420'),
	('PR', 'Ponta Grossa', 'Centro', 'Rua Riachuelo', '84010-260'),
	('RJ', 'Rio de Janeiro', 'Copacabana', 'Avenida Atlântica', '22070-001'),
	('PR', 'Ponta Grossa', 'Jardim Carvalho', 'Rua Doutor Washington Subtil Chueire', '84017-220'),
	('MG', 'Belo Horizonte', 'Savassi', 'Rua Pernambuco', '30130-150'),
	('RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', '90570-080'),
	('PR', 'Curitiba', 'Batel', 'Rua Buenos Aires', '80250-070'),
	('PR', 'Londrina', 'Centro', 'Rua Pernambuco', '86020-320'),
	('PR', 'Maringá', 'Zona 07', 'Avenida Brasil', '87015-000'),
	('PR', 'Foz do Iguaçu', 'Jardim Central', 'Avenida República Argentina', '85864-220'),
	('PR', 'Ponta Grossa', 'Órfãs', 'Rua Comendador Miró', '84015-160'),
	('BA', 'Salvador', 'Barra', 'Avenida Oceânica', '40140-130'),
	('PE', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem', '51021-000');
    
INSERT INTO departamento (NOME, SIGLA)
	VALUES ('Departamento de Informática', 'INF'),
    ('Departamento de Mecânica', 'MEC'),
    ('Departamento de Eletrônica', 'ELE'),
    ('Departamento de Produção', 'PRO');
    
INSERT INTO funcionario (NOME, CPF, EMAIL, DATAADMISSAO, SALARIO, IDDEPARTAMENTO, IDENDERECO)
	VALUES ('João da Silva', '123.456.789-10', 'joao.silva@email.com', '2023-01-15', 5000, 1, 1),
   ('Maria Santos', '987.654.321-10', 'maria.santos@email.com', '2022-11-05', 4500, 2, 2),
   ('Pedro Souza', '192.837.465-20', 'pedro.souza@email.com', '2023-03-12', 5200, 1, 3),
   ('Ana Oliveira', '574.829.103-30', 'ana.oliveira@email.com', '2023-02-20', 4800, 3, 4),
   ('Carlos Costa', '384.719.205-40', 'carlos.costa@email.com', '2023-04-18', 5100, 2, 5),
   ('Camila Rodrigues', '562.830.947-50', 'camila.rodrigues@email.com', '2023-05-22', 4700, 1, 6),
   ('Lucas Almeida', '372.916.048-60', 'lucas.almeida@email.com', '2022-12-08', 4900, 3, 7),
   ('Juliana Ferreira', '640.291.350-70', 'juliana.ferreira@email.com', '2023-06-30', 5300, 2, 8),
   ('Gustavo Lima', '930.267.451-80', 'gustavo.lima@email.com', '2023-07-15', 5100, 1, 9),
   ('Mariana Gomes', '105.394.672-90', 'mariana.gomes@email.com', '2023-08-25', 4800, 3, 10),
   ('Bruno Martins', '735.293.864-00', 'bruno.martins@email.com', '2022-10-10', 4900, 2, 11),
   ('Laura Barbosa', '246.583.940-11', 'laura.barbosa@email.com', '2023-09-20', 5200, 1, 12),
   ('Gabriel Ribeiro', '540.392.815-22', 'gabriel.ribeiro@email.com', '2023-10-05', 5500, 4, 13),
   ('Beatriz Sousa', '723.869.451-33', 'beatriz.sousa@email.com', '2023-10-15', 5600, 4, 14),
   ('Rafael Castro', '159.483.726-44', 'rafael.castro@email.com', '2023-11-01', 5700, 1, 15),
   ('Larissa Carvalho', '439.721.638-55', 'larissa.carvalho@email.com', '2023-11-05', 5800, 1, 16);

   
INSERT INTO curso (NOME, SIGLA, CARGAHORARIA, IDDEPARTAMENTO) 
	VALUES ('Ciência da Computação', 'CC', 3600, 1),
	('Sistemas de Informação', 'SI', 3200, 1),
	('Engenharia de Software', 'ES', 3400, 1),
    ('Engenharia Mecânica', 'EM', 3800, 2),
	('Automação Industrial', 'AI', 3000, 2),
	('Engenharia de Controle e Automação', 'ECA', 3600, 2),
    ('Engenharia Eletrônica', 'EE', 3800, 3),
	('Engenharia de Telecomunicações', 'ET', 3400, 3),
	('Engenharia de Sistemas', 'ESI', 3600, 3),
    ('Engenharia de Produção', 'EP', 3600, 4),
	('Gestão da Qualidade', 'GQ', 3200, 4),
    ('Engenharia de Controle e Automação', 'ECA', 3600, 3),
	('Engenharia de Computação', 'EC', 3400, 3);

    
INSERT INTO equipamento (NOME, QUANTEXISTENTE)
	VALUES ('Projetor', 5),
	('Impressora', 8),
	('Scanner', 3),
	('Equipamentos de Laboratório', 15),
	('Vidrarias', 50),
	('Bancadas', 10),
	('Carteiras', 40),
	('Cadeiras', 60),
	('Mesas', 20),
	('Quadro de Vidro', 6),
	('Microscópios', 12),
	('Aparelho de Som', 8);

    
INSERT INTO sala (SIGLA, TIPOSALA, CAPACIDADE, IDDEPARTAMENTO)
	VALUES ('A1', 'Sala de Aula Teórica', 40, 1),
	('LAB1', 'Laboratório', 30, 2),
	('E1', 'Escritório', 10, 3),
	('AUD1', 'Auditório', 100, 4),
	('SC1', 'Sala de Conferência', 20, 1),
	('A2', 'Sala de Aula Teórica', 35, 2),
	('LAB2', 'Laboratório', 25, 3),
	('E2', 'Escritório', 8, 4),
	('AUD2', 'Auditório', 120, 1),
	('SC2', 'Sala de Conferência', 15, 2),
	('A3', 'Sala de Aula Teórica', 45, 3),
	('LAB3', 'Laboratório', 20, 1);



-- numero 1 --
SELECT IDEndereco, Cidade FROM endereco 
WHERE UF = 'PR' 
ORDER BY Cidade;

-- numero 2 --
SELECT F.Nome, E.* FROM funcionario AS F, endereco AS E 
WHERE F.IDEndereco = E.IDEndereco 
ORDER BY E.UF DESC, F.Nome ASC;

-- numero 3 --
SELECT Nome, Sigla FROM curso 
WHERE IDDepartamento = 101;

-- numero 4 --
SELECT F.* FROM funcionario AS F, endereco AS E 
WHERE F.IDDepartamento = 104 AND E.Cidade = 'Curitiba';

-- numero 5 --
SELECT Nome, DataAdmissao FROM funcionario 
WHERE YEAR(DataAdmissao) > 2020;

-- numero 12 --
SELECT D.Nome, D.Sigla, COUNT(*) AS totalCursos
FROM departamento AS D, curso AS C
WHERE C.IDDepartamento = D.IDDepartamento
GROUP BY D.Nome, D.Sigla
HAVING COUNT(*) = (
    SELECT MAX(numCursos)
    FROM (
        SELECT COUNT(*) AS numCursos
        FROM curso
        GROUP BY IDDepartamento
    ) AS t
);

-- numero 16 --
SHOW CREATE TABLE alocacao;

-- numero 20 --
CREATE INDEX IDX_departamento ON departamento (Sigla);
