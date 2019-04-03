/*
insert into curso (nome) values ('Ciência da Computação');
insert into curso (nome) values ('Medicina');
insert into curso (nome) values ('Engenharia Civil');
insert into curso (nome) values ('Biotecnologia');
insert into curso (nome) values ('Engenharia da computação');
insert into curso (nome) values ('Banco de dados');
insert into curso (nome) values ('Enfermagem');
insert into curso (nome) values ('Engenharia aeroespacial');
insert into curso (nome) values ('Análise de sistemas');

insert into disciplina (nome) values ('Algoritmos');
insert into disciplina (nome) values ('Anatomia');
insert into disciplina (nome) values ('Concretos');
insert into disciplina (nome) values ('Nanotecnologia');
insert into disciplina (nome) values ('Sistemas digitais');
insert into disciplina (nome) values ('Projeto de banco de dados');
insert into disciplina (nome) values ('Curativos');
insert into disciplina (nome) values ('Aerodinâmica');
insert into disciplina (nome) values ('Teste A / B');

insert into tiponota (nome) values ('Prova 1');
insert into tiponota (nome) values ('Prova 2');
insert into tiponota (nome) values ('Trabalho');

insert into aluno (nome, curso) values ('Gabriel', 1);
insert into aluno (nome, curso) values ('Bruna', 1);
insert into aluno (nome, curso) values ('Roberto', 2);
insert into aluno (nome, curso) values ('Fernanda', 2);
insert into aluno (nome, curso) values ('Vitor', 8);
insert into aluno (nome, curso) values ('Manuela', 8);

insert into situacao (aluno, situacao, disciplina) values (1, 'Aprovado', 1);
insert into situacao (aluno, situacao, disciplina) values (2, 'Aprovado', 1);
insert into situacao (aluno, situacao, disciplina) values (3, 'Reprovado', 2);
insert into situacao (aluno, situacao, disciplina) values (4, 'Reprovado', 2);
insert into situacao (aluno, situacao, disciplina) values (5, 'Aprovado', 8);
insert into situacao (aluno, situacao, disciplina) values (6, 'Reprovado', 8);


insert into notas (rgm_aluno, codigo_disciplina, tipo_nota, nota) values (1, 1, 1, 10);
insert into notas (rgm_aluno, codigo_disciplina, tipo_nota, nota) values (2, 1, 1, 8);
insert into notas (rgm_aluno, codigo_disciplina, tipo_nota, nota) values (3, 2, 2, 6);
*/