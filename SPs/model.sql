create database painelestudante;

use painelestudante;

create table notas (
    id int auto_increment primary key,
    rgm_aluno int,
    codigo_disciplina int,
    tipo_nota int,
    nota decimal(4,2),
    foreign key (rgm_aluno) references aluno (rgm),
    foreign key (codigo_disciplina) references disciplina (codigo),
    foreign key (tipo_nota) references tiponota (codigo)
);

create table disciplina (
    codigo int auto_increment primary key,
    nome varchar(60)
);

create table tiponota (
    codigo int auto_increment primary key,
    nome varchar(60)
);

create table aluno (
    rgm int auto_increment primary key,
    nome varchar(60),
    curso int,
    foreign key (curso) references curso (id)
);

create table curso (
    id int auto_increment primary key,
    nome varchar(100)
);

create table situacao (
    id int auto_increment primary key,
    aluno int,
    situacao varchar(100),
    disciplina int,
    foreign key (aluno) references aluno (rgm),
    foreign key (disciplina) references disciplina (codigo)
);
