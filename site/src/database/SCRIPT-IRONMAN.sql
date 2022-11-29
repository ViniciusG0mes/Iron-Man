CREATE DATABASE projetoIndividual;
USE projetoIndividual;

CREATE TABLE Usuario
(idCadastro int primary key auto_increment,
nomeUsuario varchar (45),
cpfUsuario varchar(11) unique , 
emailUsuario varchar (45) unique,
senhaUsuario varchar(64) ,
modPreferida varchar (45)
);


select*from Usuario;

-- Analytics de total de votos por modalidade.
select modPreferida,count(idcadastro) from usuario group by modPreferida;

-- Analytics de expressão de votos em porcentagem por modalidade.
select modPreferida, round((count(idcadastro)/(select count(idcadastro) from usuario)*100), 0) as Porcentagem from usuario group by modPreferida;

-- Lista com modalidade preferidas
select modPreferida from usuario;



CREATE TABLE Endereco
(idEndereco int primary key auto_increment,
logradouro varchar(45),
numero int,
bairro varchar (45),
cidade varchar (45),
cep char (8));

select*from Endereco;

CREATE TABLE Prova
(idProva int primary key auto_increment,
dataProva datetime,
valorProva decimal(10,2),
fkEndereco int,
foreign key (fkEndereco) references Endereco (idEndereco)
);

select*from prova;


CREATE TABLE participacao 
(fkusuario int, 
foreign key (fkUsuario) references Usuario (idCadastro),
fkProva int,
foreign key (fkProva) references Prova (idProva)) ;

select*from participacao;
drop database projetoIndividual;