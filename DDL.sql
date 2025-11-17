-- ============================================================
-- DDL - CRIAÇÃO DA ESTRUTURA DO BANCO DE DADOS
-- ============================================================

-- 1. Tabela Faculdade
CREATE TABLE Faculdade (
    id_Unidade INT PRIMARY KEY,
    Nome VARCHAR(255),
    CNPJ CHAR(14),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 2. Tabela Professores
CREATE TABLE Professores (
    id_Professor INT PRIMARY KEY,
    Nome_completo VARCHAR(255),
    Data_de_Nascimento DATE,
    Telefone CHAR(11),
    Email VARCHAR(255),
    RG CHAR(20),
    CPF CHAR(11),
    Tipo_de_Aula INT,
    Formacao INT,
    CEP VARCHAR(10),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 3. Tabela Aluno
CREATE TABLE Aluno (
    id_Aluno INT PRIMARY KEY,
    Nome_completo VARCHAR(255),
    Data_de_Nascimento DATE,
    RG CHAR(20),
    CPF CHAR(11),
    Telefone CHAR(11),
    Email VARCHAR(255),
    CEP VARCHAR(10),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 4. Tabela Curso
CREATE TABLE Curso (
    id_Curso INT PRIMARY KEY,
    Nome VARCHAR(255),
    Carga_horaria INT,
    Previsao_de_Conclusao INT,
    id_Unidade INT,
    FOREIGN KEY (id_Unidade) REFERENCES Faculdade(id_Unidade)
);

-- 5. Tabela Materias
CREATE TABLE Materias (
    id_materia INT PRIMARY KEY,
    Nome VARCHAR(255),
    id_Curso INT,
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

-- 6. Tabela Turma
CREATE TABLE Turma (
    id_Turma INT PRIMARY KEY,
    id_materia INT,
    id_professor INT,
    Ano_semestre VARCHAR(10),
    Sala VARCHAR(20),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_Professor)
);

-- 7. Tabela Matricula
CREATE TABLE Matricula (
    id_Matricula INT PRIMARY KEY,
    id_Aluno INT,
    id_Curso INT,
    Data_Matricula DATE,
    FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno),
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

-- 8. Tabela Nota
CREATE TABLE Nota (
    id_Turma INT,
    id_Matricula INT,
    Nota DECIMAL(5,2),
    FOREIGN KEY (id_Turma) REFERENCES Turma(id_Turma),
    FOREIGN KEY (id_Matricula) REFERENCES Matricula(id_Matricula)
);

-- ============================================================
-- DML - POPULANDO DADOS DE TESTE
-- ============================================================

INSERT INTO Faculdade (id_Unidade, Nome, CNPJ, Endereco, Cidade, Estado) VALUES
(1, 'Universidade Tech & Business', '12345678000199', 'Av. Paulista, 1000', 'São Paulo', 'SP');

INSERT INTO Professores (id_Professor, Nome_completo, Data_de_Nascimento, Email, Tipo_de_Aula, Formacao, Cidade, Estado) VALUES
(100, 'Carlos Sênior', '1980-05-20', 'carlos.prof@faculdade.com', 1, 3, 'São Paulo', 'SP');

INSERT INTO Curso (id_Curso, Nome, Carga_horaria, Previsao_de_Conclusao, id_Unidade) VALUES
(10, 'Análise e Desenvolvimento de Sistemas', 2800, 2025, 1);

INSERT INTO Materias (id_materia, Nome, id_Curso) VALUES
(501, 'Algoritmos e Lógica', 10),
(502, 'Banco de Dados Relacional', 10),
(503, 'Engenharia de Software', 10);

INSERT INTO Aluno (id_Aluno, Nome_completo, Email, Cidade, Estado) VALUES
(202401, 'Guilherme Rodrigues', 'guilherme.dev@email.com', 'São Roque', 'SP');

INSERT INTO Matricula (id_Matricula, id_Aluno, id_Curso, Data_Matricula) VALUES
(999, 202401, 10, '2024-01-15');

INSERT INTO Turma (id_Turma, id_materia, id_professor, Ano_semestre, Sala) VALUES
(80, 502, 100, '2024-1', 'Lab 03');

INSERT INTO Nota (id_Turma, id_Matricula, Nota) VALUES
(80, 999, 10.00);
