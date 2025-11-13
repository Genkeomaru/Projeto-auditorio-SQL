-- 1. Tabela Faculdade (Não depende de ninguém)
CREATE TABLE Faculdade (
    id_Unidade INT PRIMARY KEY,
    Nome VARCHAR(255),
    CNPJ CHAR(14),
    Endereco VARCHAR(255),
    Cidade VARCHAR(100),
    Estado CHAR(2)
);

-- 2. Tabela Professores (Não depende de ninguém)
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

-- 3. Tabela Aluno (Não depende de ninguém)
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

-- 4. Tabela Curso (Depende da Faculdade)
CREATE TABLE Curso (
    id_Curso INT PRIMARY KEY,
    Nome VARCHAR(255),
    Carga_horaria INT,
    Previsao_de_Conclusao INT,
    id_Unidade INT,
    FOREIGN KEY (id_Unidade) REFERENCES Faculdade(id_Unidade)
);

-- 5. Tabela Materias (Depende do Curso)
CREATE TABLE Materias (
    id_materia INT PRIMARY KEY,
    Nome VARCHAR(255),
    id_Curso INT,
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

-- 6. Tabela Turma (Depende de Materia e Professor)
CREATE TABLE Turma (
    id_Turma INT PRIMARY KEY,
    id_materia INT,
    id_professor INT,
    Ano_semestre VARCHAR(10),
    Sala VARCHAR(20),
    FOREIGN KEY (id_materia) REFERENCES Materias(id_materia),
    FOREIGN KEY (id_professor) REFERENCES Professores(id_Professor)
);

-- 7. Tabela Matricula (Liga Aluno e Curso)
CREATE TABLE Matricula (
    id_Matricula INT PRIMARY KEY,
    id_Aluno INT,
    id_Curso INT,
    Data_Matricula DATE,
    FOREIGN KEY (id_Aluno) REFERENCES Aluno(id_Aluno),
    FOREIGN KEY (id_Curso) REFERENCES Curso(id_Curso)
);

-- 8. Tabela Nota (Depende da Turma e da Matricula)
CREATE TABLE Nota (
    id_Turma INT,
    id_Matricula INT,
    Nota DECIMAL(5,2), -- Ex: 10.00
    FOREIGN KEY (id_Turma) REFERENCES Turma(id_Turma),
    FOREIGN KEY (id_Matricula) REFERENCES Matricula(id_Matricula)
);
