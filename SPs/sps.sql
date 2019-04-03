-- PROJETO DE BANCO DE DADOS - ATIVIDADES COM STORED PROCEDURES

-- 1.Criar uma SP para verificar se o tipo da nota existe.
/*
DELIMITER $$
USE painelestudante$$

DROP PROCEDURE IF EXISTS getExistsTipoNota$$

CREATE PROCEDURE getExistsTipoNota(IN nomeNota VARCHAR(50), OUT statusNota VARCHAR(50))
BEGIN
     DECLARE nota VARCHAR(50);
     
     SELECT nome INTO nota
     FROM tiponota
     WHERE nome = nomeNota;
     
    IF (nota is null) THEN 
    SET statusNota = 'false';
    ELSE 
    set statusNota = 'true';
    END IF;
     	
END$$
     	
DELIMITER ;

CALL getExistsTipoNota('Prova', @status);

SELECT @status;
*/
/* OU */
/*
DROP PROCEDURE IF EXISTS exercicio1;
DELIMITER $$
USE painelestudante$$
CREATE PROCEDURE exercicio1 (IN codigo FLOAT,OUT retorno VARCHAR(50)) 
BEGIN 
    IF (codigo IN  (SELECT tn.codigo
                      FROM tiponota tn 
                     WHERE tn.codigo = codigo)) THEN
	SET retorno = 'encontrado';
    ELSE
	SET retorno = 'não Encontrado';
    END IF;
END$$
DELIMITER ;

CALL exercicio1 (2, @resp);

SELECT @resp;


-- 2. Criar uma SP para inserir uma nota na tabela de notas. Mas 
-- antes de inserir a nota verificar se o tipo da nota existe na tabela 
-- tiponota

DROP PROCEDURE IF EXISTS exercicio2;
DELIMITER $$
USE painelestudante$$
CREATE PROCEDURE exercicio2 (IN codigo FLOAT)
BEGIN
    IF (codigo IN (SELECT tn.codigo
                     FROM tiponota tn
                    WHERE tn.codigo = codigo)) THEN
	INSERT INTO notas VALUES (5, 3, 1, codigo, 5 );
     END IF;
END$$
DELIMITER ;
*/
-- 3. Criar uma função que retorne a nota p1 do aluno passando
-- como parâmetro rgm e a Disciplina

DELIMITER $$

drop function if exists notaAluno;
CREATE FUNCTION notaAluno (rgm_aluno int, codigo_disciplina int) 
RETURNS FLOAT DETERMINISTIC

BEGIN
     DECLARE nota float;
     
     SELECT n.nota into nota
     from notas n
     where n.codigo_disciplina = codigo_disciplina
     and n.rgm_aluno = rgm_aluno
     and n.tipo_nota = 1;
     
     RETURN (nota);
     END$$
     
DELIMITER ;
     
select * from aluno;

select rgm, nome, notaAluno(rgm, 1) from aluno;

     /*
-- 4. Criar uma SP que retorne a nota do aluno passando como parâmetro o 
-- rgm, a disciplina e a nota.

DROP PROCEDURE IF EXISTS exercicio4;
DELIMITER $$
USE painelestudante$$
CREATE PROCEDURE exercicio4 (IN rgm_aluno FLOAT, IN codigo_disciplina FLOAT, IN tipo_nota FLOAT, OUT nota FLOAT)
BEGIN
    SELECT n.nota INTO nota
      FROM notas n
     WHERE n.rgm_aluno = rgm_aluno AND
           n.codigo_disciplina = codigo_disciplina AND
           n.tipo_nota = tipo_nota;
    
END$$
DELIMITER ;

CALL exercicio4 (3, 1, 2, @nt);

SELECT @nt;


-- 5. Criar uma SP que retorne a media do aluno (p1+p2)/2, passando 
-- o rgm do aluno e a disciplina como parâmetros.

DROP PROCEDURE IF EXISTS exercicio5;
DELIMITER $$
USE programacao_exercicio $$
CREATE PROCEDURE exercicio5 (IN rgm_aluno FLOAT, IN codigo_disciplina FLOAT, OUT media FLOAT)
BEGIN
    SELECT SUM(n.nota/2) INTO media
      FROM notas n
     WHERE n.rgm_aluno = rgm_aluno AND
           n.codigo_disciplina = codigo_disciplina AND
           n.tipo_nota IN ('1','2');
           
END$$
DELIMITER ;

CALL exercicio5 (1, 1, @media);

SELECT @media;
           */