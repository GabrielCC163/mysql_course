/*
3. Crie uma SP que gere os registros da tabela Ocupação 
para um determinado dia (parâmetro) informado para todos os 
apartamentos do Hotel. Incluir com o Status = 'L' (Livre). 
Validar caso a data informada já tenha registros gerados. 
*/
/*
DELIMITER $$

DROP PROCEDURE IF EXISTS preparaQuartosDia;

CREATE PROCEDURE preparaQuartosDia (IN dia date, OUT ok boolean)
BEGIN

    IF ((SELECT count(dataocup) FROM ocupacao WHERE dataocup = dia limit 1) > 0) THEN
        SET ok = false;
    ELSE
        INSERT INTO ocupacao (dataocup, statusocup, napartamento)
        SELECT distinct @dia, 'L', napartamento from apartamento;
        SET ok = true;
    END IF;
    
END$$

DELIMITER ;

set @dia = '2017-01-01';
CALL preparaQuartosDia(@dia, @ok);
select @ok;

select dataocup, statusocup, napartamento from ocupacao where dataocup = '2017-01-01';
*/
/*
4. Criar uma SP que calcule o valor final de uma hospedagem, 
recebendo como parâmetro um código de hospedagem. 
Validar se é uma hospedagem em aberto. 
*/

-- select round(sum(valor)), codhospedagem from contacorrente group by 2;
DELIMITER $$

DROP PROCEDURE IF EXISTS calcHospedagem;

CREATE PROCEDURE calcHospedagem (IN codhosp int, OUT total int)
BEGIN

    IF ((SELECT datasaida FROM hospedagem WHERE codhospedagem = codhosp) is null) THEN
        select round(sum(valor)) into total from contacorrente 
        where codhospedagem = codhosp;
    ELSE
        set total = 0;
    END IF;
    
END$$

DELIMITER ;

set @codhosp = 1;
CALL calcHospedagem(@codhosp, @total);
select @total;


/*
5. Criar uma SP que atualize o status da ocupação
quando um checkin é realizado. Passar o código da
reserva como parâmetro.
*/

DELIMITER $$

DROP PROCEDURE IF EXISTS atualizaOcupWhenCheckin;

CREATE PROCEDURE atualizaOcupWhenCheckin(IN codres INT)
BEGIN
    
    declare dtres date;
    declare numap int;
    select dataentrada into dtres from reserva where codreserva = codres;
    select napartamento into numap from reserva where codreserva = codres;
    
    update ocupacao set statusocup = 'R' where dataocup = dtres and napartamento = numap;
    
END$$

DELIMITER ;

set @codres = 5;
CALL atualizaOcupWhenCheckin(@codres);