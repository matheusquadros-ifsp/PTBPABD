-- Questão 1
CREATE SCHEMA avaliacaocontinua;

-- Questão 2
CREATE TABLE avaliacaocontinua.company (
    company_name VARCHAR(100) NOT NULL,
    city VARCHAR(100),
    CONSTRAINT pk_company PRIMARY KEY (company_name)
);

-- Questão 3
CREATE TABLE avaliacaocontinua.employee (
    person_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    city VARCHAR(100),
    CONSTRAINT pk_employee PRIMARY KEY (person_name)
);

-- Questão 4
CREATE TABLE avaliacaocontinua.manages (
    person_name VARCHAR(100) NOT NULL,
    manager_name VARCHAR(100),
    CONSTRAINT pk_manages PRIMARY KEY (person_name)
);

-- Questão 5
CREATE TABLE avaliacaocontinua.works (
    person_name VARCHAR(100) NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    CONSTRAINT pk_works PRIMARY KEY (person_name)
);

-- Questão 6
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_employee
FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE ON DELETE CASCADE;

-- Questão 7
ALTER TABLE avaliacaocontinua.works
ADD CONSTRAINT fk_works_company
FOREIGN KEY (company_name) REFERENCES avaliacaocontinua.company(company_name)
ON UPDATE CASCADE ON DELETE CASCADE;

-- Questão 8
ALTER TABLE avaliacaocontinua.manages
ADD CONSTRAINT fk_manages_employee
FOREIGN KEY (person_name) REFERENCES avaliacaocontinua.employee(person_name)
ON UPDATE CASCADE ON DELETE CASCADE;