CREATE DATABASE T_ManualPecas

USE T_ManualPecas

-- DDL

CREATE TABLE Pecas
(
	IdPeca			INT PRIMARY KEY IDENTITY
	,CodigoPeca		INT NOT NULL
	,Descricao		VARCHAR(255) NOT NULL
);

ALTER TABLE Pecas DROP COLUMN CodigoPeca
ALTER TABLE Pecas ADD CodigoPeca INT UNIQUE

CREATE TABLE Fornecedores
(
	IdFornecedor	INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR(255) NOT NULL
	,Email			VARCHAR(255) NOT NULL
	,Senha			VARCHAR(255)NOT NULL
);

ALTER TABLE Fornecedores DROP COLUMN Email
ALTER TABLE Fornecedores ADD Email VARCHAR(255) NOT NULL UNIQUE

CREATE TABLE Vendas
(
	IdPeca			INT FOREIGN KEY REFERENCES Pecas (IdPeca)
	,IdFornecedor	INT FOREIGN KEY REFERENCES Fornecedores (IdFornecedor)
	,Preco			FLOAT NOT NULL
);

ALTER TABLE Vendas DROP COLUMN Preco
ALTER TABLE Vendas ADD Preco VARCHAR(255) NOT NULL 

-- DML

INSERT INTO Pecas (CodigoPeca, Descricao)
VALUES ('1234','Faca Ak-47, a fac perfeita para o combate')
	   ,('1324','Suco de Goiaba delicioso')
	   ,('4316','Cinto da Off-White')
	   ,('5243','Pczão brabissimo DALE')

UPDATE Pecas SET CodigoPeca = '9877' WHERE IdPeca = 1;

UPDATE Pecas SET Descricao = 'Motor V.2 Turbo' WHERE IdPeca = 1;
UPDATE Pecas SET Descricao = 'Engrenagem 90 ml' WHERE IdPeca = 2;
UPDATE Pecas SET Descricao = '100 Kgs de Batata Doce' WHERE IdPeca = 3;
UPDATE Pecas SET Descricao = '100.000 Kgs de Aluminio' WHERE IdPeca = 4;
UPDATE Pecas SET Descricao = '10 gs de Canela' WHERE IdPeca = 5;

INSERT INTO Fornecedores (Nome, Email, Senha)
VALUES ('Tiaguinho','tiago@tiago.com','123456')
	   ,('Carvalihno','carvalho@carvalho.com','654321')
	   ,('Anninha','anna@anna.com','132435')
	   ,('Raicinha','raica@raica','645342')

INSERT INTO Vendas (IdPeca, IdFornecedor, Preco)
VALUES (1,1,'R$10.330,00')
       ,(2,2,'R$15,65')
	   ,(2,4,'R$14,50')
	   ,(3,2,'R$120,00')
	   ,(4,3,'R$130,00')
	   ,(4,1,'R$9.670,00')

-- DQL

SELECT * FROM Pecas
SELECT * FROM Fornecedores
SELECT * FROM Vendas

-- TABELA PRINCIPAL

SELECT P.Descricao, F.Nome, V.Preco
FROM Pecas P
JOIN Fornecedores F 
ON P.IdPeca = F.IdFornecedor
JOIN Vendas V
ON P.IdPeca = V.IdPeca;

