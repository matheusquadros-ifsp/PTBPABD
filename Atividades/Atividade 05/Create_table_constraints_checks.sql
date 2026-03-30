--Questão 1
CREATE TABLE pessoa (
    ID INT,
    nome VARCHAR(100),
    sobrenome VARCHAR(100),
    idade INT,
    CONSTRAINT chk_idade CHECK (idade >= 0)
);

-- Questão 2
ALTER TABLE pessoa
ADD CONSTRAINT uq_pessoa UNIQUE (ID, nome, sobrenome);

-- Questão 3
ALTER TABLE pessoa
ALTER COLUMN idade INT NOT NULL;

-- Questão 4
CREATE TABLE endereco (
    ID INT PRIMARY KEY,
    rua VARCHAR(200)
);

ALTER TABLE pessoa
ADD id_endereco INT;

ALTER TABLE pessoa
ADD CONSTRAINT fk_pessoa_endereco FOREIGN KEY (id_endereco) REFERENCES endereco(ID);