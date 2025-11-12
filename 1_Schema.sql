Table Aluno {
  id_Aluno int [pk]
  Nome_completo text
  Data_de_Nascimento date
  RG char(20)
  CPF char(11)
  Telefone char(11)
  Email varchar
  CEP varchar
  Endereço varchar
  Cidade varchar
  Estado varchar
}

Table Matricula {
  id_Matricula int [pk]
  id_Aluno int
  id_Curso int
  Data_Matricula date
}

Table Curso {
  id_Curso int [pk]
  Nome text
  Carga_horaria int
  Previsão_de_Conclusão int
  id_Unidade int
}

Table Faculdade {
  id_Unidade int [pk]
  Nome text
  CNPJ char(14)
  Endereço varchar
  Cidade varchar
  Estado varchar
}

Table Materias {
  id_materia int [pk]
  Nome text
  id_Curso int
}

Table Turma {
  id_Turma int [pk]
  id_materia int
  id_professor int
  Ano_semestre varchar
  Sala varchar
}

Table Professores {
  id_Professor int [pk]
  Nome_completo text
  Data_de_Nascimento date
  Telefone char(11)
  Email varchar
  RG char(20)
  CPF char(11)
  Tipo_de_Aula int
  Formação int
  CEP varchar
  Endereço varchar
  Cidade varchar
  Estado varchar
}

Table Nota {
  id_Turma int
  id_Matricula int
  Nota decimal (10)
}

Ref {
  Aluno.id_Aluno > Matricula.id_Aluno
}

Ref {
  Curso.id_Curso > Matricula.id_Curso
}

Ref {
  Faculdade.id_Unidade > Curso.id_Unidade
}

Ref {
  Curso.id_Curso > Materias.id_Curso
}

Ref {
  Turma.id_Turma > Nota.id_Turma
}

Ref {
  Matricula.id_Matricula > Nota.id_Matricula
}

Ref {
  Materias.id_materia > Turma.id_materia
}

Ref {
  Professores.id_Professor > Turma.id_professor
}
